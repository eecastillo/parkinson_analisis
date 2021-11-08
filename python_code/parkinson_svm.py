#Import scikit-learn dataset library
from sklearn import datasets
import pandas as pd
import pickle
from sklearn import svm

filename = "parkinson_svm_model.sav"

df_names = ["jitter_local","jitter_local_absolute","jitter_rap","jitter_ppq5","jitter_ddp",
            "shimmer_local","shimer_local_db","shimmer_apq3","shimmer_apq5","shimmer_apq11","shimer_dda",
            "ac","nth","htn","median_pitch","mean_pitch","standard_deviation","minimum_pitch","maximum_pitch",
            "number_pulses","periods","mean_period","std_period","locally_unvoiced_frames","voice_breaks",
            "degree_voice_break"]
df_audio=pd.read_csv('./audio_new_ethan_test.csv')
df_audio.columns = df_names

loaded_model = pickle.load(open(filename, 'rb'))
y_pred=loaded_model.predict(df_audio)

if y_pred[0] == 1:
  print("Patient has some form of parkinson")
else:
  print("Patient does not have parkinson")