#Install the required dependencies
!pip install praat-parselmouth
!pip install my-voice-analysis

#Import the required libraries
import glob
import numpy as np
import pandas as pd
import parselmouth 
import statistics

from parselmouth.praat import call
from scipy.stats.mstats import zscore
from sklearn.decomposition import PCA
from sklearn.preprocessing import StandardScaler
import matplotlib.pyplot as plt
import seaborn as sns

parameters = ["Jitter (local): ","Jitter (local, absolute): ","Jitter (rap): ","Jitter (ppq5): ","Jitter (ddp): ",
              "Shimmer (local): ","Shimmer (local, dB): ","Shimmer (apq3): ","Shimmer (apq5): ","Shimmer (apq11): ","Shimmer (dda): ",
              "Mean autocorrelation: ","Mean noise-to-harmonics ratio: ","Mean harmonics-to-noise ratio: ",
              "Median pitch: ","Mean pitch: ","Standard deviation: ","Minimum pitch: ","Maximum pitch: ",
              "Number of pulses: ","Number of periods: ","Mean period: ","Standard deviation of period: ",
              "Fraction of locally unvoiced frames: ","Number of voice breaks: ","Degree of voice breaks: "]

parameters_j_units = ["%\n","seconds\n","%\n","%\n","%\n",
                      "%\n","dB\n","%\n","%\n","%\n","%\n",
                      "\n","\n","dB\n",
                      "Hz\n","Hz\n","Hz\n","Hz\n","Hz\n",
                      "\n","\n","seconds\n","seconds\n",
                      "%","\n","%"]

sns.set() # Use seaborn's default style to make attractive graphs
plt.rcParams['figure.dpi'] = 100 # Show nicely large images in this notebook

#function to get all needed data from audio
def getData(voiceID):
    sound = parselmouth.Sound(voiceID)
    pitch = sound.to_pitch_ac(very_accurate=False)
    point_process = parselmouth.praat.call([sound, pitch], "To PointProcess (cc)")
    voice_report = parselmouth.praat.call([sound, pitch, point_process], "Voice report", 0, 0, 75, 600, 1.3, 1.6, 0.03, 0.45)
    return voice_report

#function to plot sound in time
def plotSound(sound):
    plt.figure()
    plt.plot(sound.xs(), sound.values.T)
    plt.xlim([sound.xmin, sound.xmax])
    plt.xlabel("time [s]")
    plt.ylabel("amplitude")
    plt.title("Sound Wave")
    plt.show() # or plt.savefig("sound.png"), or plt.savefig("sound.pdf")

#function for writting the spectogram
def draw_spectrogram(spectrogram, dynamic_range=70):
    X, Y = spectrogram.x_grid(), spectrogram.y_grid()
    sg_db = 10 * np.log10(spectrogram.values)
    plt.pcolormesh(X, Y, sg_db, vmin=sg_db.max() - dynamic_range, cmap='afmhot')
    plt.ylim([spectrogram.ymin, spectrogram.ymax])
    plt.xlabel("time [s]")
    plt.ylabel("frequency [Hz]")

#function for drawing the voice intensity
def draw_intensity(intensity):
    plt.plot(intensity.xs(), intensity.values.T, linewidth=3, color='w')
    plt.plot(intensity.xs(), intensity.values.T, linewidth=1)
    plt.grid(False)
    plt.ylim(0)
    plt.ylabel("intensity [dB]")

# function for plotting the spectogram
def showSpectogram(sound):
    intensity = sound.to_intensity()
    spectrogram = sound.to_spectrogram()
    plt.figure()
    draw_spectrogram(spectrogram)
    plt.twinx()
    draw_intensity(intensity)
    plt.xlim([sound.xmin, sound.xmax])
    plt.title("Spectrogram")
    plt.show()

#function to get the float values from the report string
def getDataFromReport(voice_report_data):
  voice_df = pd.DataFrame(columns = parameters)
  for p_index in range(len(parameters)):
    i = voice_report.index(parameters[p_index]) + len(parameters[p_index])
    j = voice_report.index(parameters_j_units[p_index], i)
    voice_data = float(voice_report[i:j])
    if("%" in parameters_j_units[p_index]):
      voice_data = voice_data/100
    voice_df.loc[1, parameters[p_index]] = voice_data
    #print(parameters[p_index]+"  "+str(voice_data))
  return voice_df

# sound initialization
sound = parselmouth.Sound("/content/fer_audio.wav")
plotSound(sound)
showSpectogram(sound)
voice_report = getData(sound)
df_voice_report = getDataFromReport(voice_report)
df_voice_report.to_csv('audio_features.csv',index=False)