% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/DfReadLrocDataFile.R
\name{DfReadLrocDataFile}
\alias{DfReadLrocDataFile}
\title{Read a LROC data file}
\usage{
DfReadLrocDataFile(RADIOLOGISTS = TRUE)
}
\arguments{
\item{RADIOLOGISTS}{Logical; if TRUE, the default, only radiologists are 
analyzed otherwise all readers are analyzed}
}
\value{
The \strong{LROC} dataset.
}
\description{
Read the Hupse-Karssemeijer LROC data file, a study comparing 
   standalone performance of breast CAD vs. radiologists; the study 
   actually included radiologists and residents; the following usage 
   includes only the radiologists
}
\details{
The data format is similar to the JAFROC format (see \code{\link{RJafroc-package}}) 
   with the \strong{crucial difference} that there are two types of LL (TP) events: 
   those representing correct localizations and those representing incorrect 
   localizations. Also, every diseased case has one lesion and NLs are not possible 
   on diseased cases. \code{J} is one plus the number of readers. The first treatment 
   is CAD, followed by the readers.

The return value is a list with the following elements: 
\itemize{
\item{\code{NL}}{ [1, 1:J, 1:K1, 1] array containing the FP ratings}
\item{\code{LLCl}}{ [1, 1:J, 1:K2, 1] array containing the TP correct localization ratings}
\item{\code{LLIl}}{ [1, 1:J, 1:K2, 1] array containing the TP incorrect localization ratings}
\item{\code{lesionVector}}{ array [1:K2], as in standard JAFROC/ROC format dataset, ones}
\item{\code{lesionID}}{ array [1:K2], as in standard JAFROC/ROC format dataset, ones}
\item{\code{lesionWeight}}{ array [1:K2], weights (or clinical importances) of lesions}
\item{\code{dataType}}{ "LROC", the data type}
\item{\code{modalityID}}{ [1:I], treatment labels}
\item{\code{readerID}}{ [1:J], reader labels}
}
}
\examples{
radData <- DfReadLrocDataFile()
str(radData)
allData <- DfReadLrocDataFile(FALSE)
str(allData)



}
\references{
Hupse R, Samulski M, Lobbes M, et al. Standalone computer-aided detection compared 
to radiologists' performance
for the detection of mammographic masses. Eur Radiol 2013.

Chakraborty DP (2017) \emph{Observer Performance Methods for Diagnostic Imaging - Foundations, 
Modeling, and Applications with R-Based Examples}, CRC Press, Boca Raton, FL. 
\url{https://www.crcpress.com/Observer-Performance-Methods-for-Diagnostic-Imaging-Foundations-Modeling/Chakraborty/p/book/9781482214840}
}
