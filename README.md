# EEG Processing

## About repository

<p><b>EEG Processing</b> contains different methods for processing electroencephalogram using MATLAB.</p>
<p>The following processing procedures are presented:</p>

 - [EEG сorrelation analysis](#eeg-сorrelation-analysis) 
 - [Measuring EEG rhythms](#measuring-eeg-rhythms)

## EEG сorrelation analysis
<p>The downloaded electroencephalogram signal samples (sampling rate = 250 Hz) contained 10 chanels.</p>
<p>A correlation matrix illustrating the dependencies between the EEG channels was constructed.</p>
<p>The resulting matrix was transformed into a graded matrix with a given threshold to emphasize statistically significant dependencies.</p>
<p>Results are presented on the picture below:</p>

<p><img src="screenshots/screen1.JPG" /></p>

## Measuring EEG rhythms
<p>EEG signals of patients with eyes closed and eyes open were downloaded to study electroencephalography rhythms (with eyes closed there is a greater alpha rhythm power).</p>
<p>Digital filters are used to examine each rhythm individually, filtering out the desired range of frequencies. The AFC and impulse response of these filters are shown in the figures.</p>
<p>The result of the filtered EEG is shown on the graph. Estimates of the signal dispersion before and after filtering are also displayed.</p>
<p>The pictures below show screenshots of the program:</p>

<p><img src="screenshots/screen2.JPG"/> </p>

<p><img src="screenshots/screen3.JPG"/> </p>

<p><img src="screenshots/screen4.JPG"/> </p>
