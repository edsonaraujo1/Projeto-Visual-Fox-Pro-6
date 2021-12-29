////////////////////////////////////////////////////////////////////////////////
////                                                                        ////
////    WinVisionPro Development Library - (c) 1994 Quanta Corporation      ////
////    Functions for control and image transfer                            ////
////    Tel(415)967-5791  Fax(415)967-8762  BBS(415)967-8830                ////
////                                                                        ////
////////////////////////////////////////////////////////////////////////////////

//// Valid values for video source in SetCapture
#define BWCOMPOSITE 0
#define COMPOSITE   1
#define SVIDEO      2

#define BWCOMP0     10
#define BWCOMP1     11
#define BWCOMP2     12
#define BWCOMP3     13
#define BWCOMP4     14
#define BWCOMP5     15

#define COMP0       20
#define COMP1       21
#define COMP2       22
#define COMP3       23
#define COMP4       24
#define COMP5       25

#define SVID0       30
#define SVID1       31
#define SVID2       32

//// Valid values for image mode in SetCapture
#define COLOR     0
#define GRAYSCALE 1
#define BW        2
#define BWFAX     3

#ifdef __cplusplus
  extern "C" {
#endif

int  pascal WVSetBoard(int WVPAddr);
void pascal WVSetCapture(unsigned char Input, unsigned char Mode, int XRes, int YRes,
			 int Brightness, int Contrast, int Saturation);
void pascal WVWriteSpecialReg(unsigned char WVReg, unsigned char WVVal);
unsigned char pascal WVReadSpecialReg(unsigned char WVReg);
unsigned char pascal WVVideoStatus(void);

void pascal WVStartCapture(void);
void pascal WVStartTrigCapture(void);
unsigned char pascal WVCaptureDone(void);
void pascal WVPrepareXfer(void);
void pascal WVPrepareXferSkip(int VertSkip);
void pascal WVReadLine(unsigned char far * LinePtr);
#ifdef _Windows
HANDLE pascal WVReadDib(void);
#endif
#ifdef __cplusplus
  }
#endif
