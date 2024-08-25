import os
import pickle
import tensorflow as tf
from keras.models import load_model
import keras.utils as kerasUtils
from PIL import Image
from werkzeug.utils import secure_filename
import numpy as np
import logging
import warnings

warnings.filterwarnings(action="ignore")

logging.basicConfig(filename="log.log", level=logging.WARNING)

os.environ['TF_CPP_MIN_LOG_LEVEL']='2'
os.environ['TF_ENABLE_ONEDNN_OPTS']='0'

def saveResourceAtDirectory(uploadFile):
    try:
        path=f"uploads/{uploadFile.filename}"
        with open(path, "wb") as f:
            f.write(uploadFile.file.read())
        return path
    except Exception as e:
        print(e)
        
def loadModel():
    try:
        with open('labels.pkl', 'rb') as labelPickle:
            modelLabels=pickle.load(labelPickle)[0]
            
        model=load_model('model.h5')
        
        return modelLabels, model
    except Exception as e:
        logging.exception(e)
            
            
def preprocessImage(imageFile):
    try:
        imageArray=kerasUtils.img_to_array(imageFile)
        imageArray=imageArray/255
        imageArray=np.expand_dims(imageArray, axis=0)
        return imageArray
    except Exception as e:
        logging.exception(e)
    
def makePrediction(imagePath):
    try:
        modelLabels, model=loadModel()
        
        imageFile=kerasUtils.load_img(path=imagePath, target_size=(224, 224))
        
        imageArray=preprocessImage(imageFile=imageFile)
        
        prediction=model.predict(imageArray)
        
        confidence=round(100 * (np.max(prediction[0])), 2)
        
        prediction=modelLabels[np.argmax(prediction[0])]
                
        return prediction, confidence
    except Exception as e:
        logging.exception(e)
        