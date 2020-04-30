# LDPC Codes for Deep-Space Communications

This numerical simulator implements an encoder and three different decoders for the performance analysis of the Low Density Parity Check (LDPC) code described in the [NASA GSFC-STD-9100 standard](https://standards.nasa.gov/standard/gsfc/gsfc-std-9100). In particular, the software implements the (8176,7154) code described in Chapter 7 of the «CCSDS Recommended Standards for TM synchronization and channel coding».

## Code details

This code is designed for any __space communications link__ although it was initially targeted for communications links between spacecraft to ground elements. Current advances in space qualified field programmable gate array (FPGA) technology has potentially given rise to implementations for space to space communication links as well. As a result, this code can apply to __any space link that requires bandwidth efficient communications__.

An an example of application, this code is used by the [Landsat Data Continuity Mission](https://www.nasa.gov/directorates/heo/scan/services/missions/earth/LDCM.html) (Launched: February, 2013). In particular, it is adopted to downlink data transmission in the X-band. This 384 Mbps data rate communications link is NASA’s first operational use of an LDPC and is the first use of an LDPC code for a space to ground link for any agency or company.

## Decoder
The decoding is done using a __message-passing algorithm__. This is an iterative decoding technique
as the messages pass back and forward between the bit and check nodes iteratively until a
result is achieved (or the process halted).
The sent messages are __probabilities__ which represent a __level of belief__ about the value of the codeword bits.
It is convenient to represent probability values as __log likelihood ratios (LLRs)__. This kind of decoding is called __sum-product decoding__ since the use of LLRs allows the calculations at the bit and check nodes to be computed using sum and product operations.

Check nodes computation can be optimized in terms of complexity, considering than in the output message computation, the term corresponding to the smallest LLR, dominates the product term, so the product can be approximated by a minimum. This variant is called __min-sum__.

## List of files
* `./generator.m` - create the LDPC code generator matrix and export it to the data.mat file
* `/SP/` - sum-product decoder with soft decision (implemented both in MATLAB and C)
* `./SP-H/` - sum-product decoder with hard decision (implemented both in MATLAB and C)
* `./MS/` - min-sum decoder (implemented in MATLAB)
* `./plots/` - code for plotting the pre-computed performance

## Performance
In the following, we provide the achieved performance, measured as _bit error probability (Pbit)_ for different values of _SNR_ (measured as Eb/N0).

![alt text](https://raw.githubusercontent.com/nicopi/deep-space/master/doc/img/SPvsMS.png "sum-product vs min.sum")
__Fig. 1.__ Performance achieved by the sum-product and min-sum decoders.

![alt text](https://raw.githubusercontent.com/nicopi/deep-space/master/doc/img/SPH.png "sum-product vs min.sum")
__Fig. 2.__ Comparison between sum-product/min-sum with soft-decision and sum-product with hard decision.
