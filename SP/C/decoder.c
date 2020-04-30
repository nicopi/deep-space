/* LDPC for DEEP-SPACE communications
 * Copyright(C) 2014 Nicola Piovesan
 *
 * Message Passing - sum-product
 * Note: compile with mex -O CFLAGS="\$CFLAGS -std=c99" decoder.c
 *
 *  This program is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *  
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *  
 *  You should have received a copy of the GNU General Public License
 *  along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

#include "math.h"
#include "mex.h"
#include "matrix.h"
#include <stdlib.h>
#include <float.h>
#include "limits.h"
#define sign(x) (x>=0.0?1.0:-1.0)

/*Functions*/
void decision(double *r, double H[1022][8176], double sigw, double bTc[1022][32], double cTb[8176][4], int maxIT, double *finale)
{
    //variables declaration
    double *llr, **Ek, **M, num,temp;
    int *z, i, j,exit,I, sum, b, c,tot,min;
    
    //variables allocation and initialization
    z=(int *) malloc(8176*sizeof(int));
    llr=(double *) malloc(8176*sizeof(double));
    
    Ek=(double **) malloc(1022*sizeof(double *));
    for(i=0;i<1022;i++)
        Ek[i]=(double *) malloc(8176*sizeof(double));
    
    M=(double **) malloc(1022*sizeof(double *));
    for(i=0;i<1022;i++)
        M[i]=(double *) malloc(8176*sizeof(double));
    
    //calculate LLRs
	//initialize messages from bits
    temp=pow(sigw,2);
    for(i=0;i<8176;i++){
        llr[i]=-2.0*r[i]/temp;
        for(j=0;j<1022;j++){
            M[j][i]=llr[i];
            Ek[j][i]=0;
        }
    }
    
    //Start iteration
    exit=0;
    I=0;
    while(I<maxIT && exit!=1){
        for(c=0;c<1022;c++){
            for(i=0;i<32;i++){
                num=1;
                for(j=0;j<32;j++){
                    if(i!=j){
                        num=num*tanh(M[c][(int)bTc[c][j]-1]/2);
                    }
                }
                Ek[c][(int)(bTc[c][i]-1)]=log((1+num)/(1-num));
            }
        }
        
        //Compute total LLRs
        //Decode block
        for(i=0;i<8176;i++){
            sum=0;
            for(j=0;j<1022;j++){
                sum=sum+Ek[j][i];
            }
            z[i]=-(sign(sum+llr[i])-1)/2;
        }
        
        //check if decoded word is a codeword
        sum=0;
        tot=0;
        for(i=0;i<1022;i++){
            sum=0;
            for(j=0;j<8176;j++){
                sum=sum+H[i][j]*z[j];
            }
            tot=tot+abs(sum%2);
        }
        if(tot==0){
            exit=1;
        }else{
            min=INT_MAX;
            for(b=0;b<8176;b++){
                for(i=0;i<4;i++){
                    M[(int)cTb[b][i]-1][b]=0;
                    for(j=0;j<4;j++){
                        if(i!=j){
                            M[(int)cTb[b][i]-1][b]=M[(int)cTb[b][i]-1][b]+Ek[(int)cTb[b][j]-1][b];
                        }
                    }
                    M[(int)cTb[b][i]-1][b]=M[(int)cTb[b][i]-1][b]+llr[b];
                    if (abs(min)>abs(M[(int)cTb[b][i]-1][b])){
                    	min=abs(M[(int)cTb[b][i]-1][b]);
                    }
                }
            }
            for(b=0;b<8176;b++){
                for(i=0;i<4;i++){
                    if (M[(int)cTb[b][i]-1][b]<0){
                        M[(int)cTb[b][i]-1][b]=M[(int)cTb[b][i]-1][b]+min;
                    }else{
                        M[(int)cTb[b][i]-1][b]=M[(int)cTb[b][i]-1][b]-min;
                    }
                }
            }
            I++;
        }
    }
    printf(" [%d]\n",I);
    //Build the output
    for(i=0;i<7154;i++){
        finale[i]=z[i];
    }
    
    //Free memory
    for(i=0;i<1022;i++)
        free(Ek[i]);
    for(i=0;i<1022;i++)
        free(M[i]);
    free(llr);
    free(Ek);
    free(M);
    return;
    
}
/************************************************************************
 * Main function
 ************************************************************************/

void mexFunction(
        int nlhs,
        mxArray *plhs[],
        int nrhs,
        const mxArray *prhs[]
        )
{
    
    double *r, *sigwp, *maxITp, *u_hat, *H, *bTc, *cTb;
    double sigw;
    int maxIT;
    long int k, n;
    
    
    /* 1. Check validity of expressions */
    
    if (nrhs != 6)
        mexErrMsgTxt("Two input arguments required");
    if (nlhs != 1)
        mexErrMsgTxt("One output argument required");
    
    
    /* 2. Read inputs */
    
    r = mxGetPr(prhs[0]);
    n = mxGetN(prhs[0]);
    
    H = mxGetPr(prhs[1]);

    sigwp=mxGetPr(prhs[2]);
    sigw=sigwp[0];
    
    bTc = mxGetPr(prhs[3]);
    cTb = mxGetPr(prhs[4]);
    
    maxITp=mxGetPr(prhs[5]);
    maxIT=maxITp[0];
    
    /* 3. Prepare output vectors */
    plhs[0] = mxCreateDoubleMatrix(1, 7154, mxREAL);
    u_hat = mxGetPr(plhs[0]);
    
    /* 4. Run the algorithm */
    decision(r,H,sigw,bTc,cTb,maxIT, u_hat);
    
    /* 5. Exit */
    return;
}