from flask import Flask, request, jsonify
from utils.images import makePrediction, saveResourceAtDirectory

app=Flask(__name__)

@app.route('/prediction', methods =['GET', 'POST'])
def diseasePrediction(prediction=" ", confidence=0, recommendedProducts=None):
    try:
        if request.method == 'POST':
            imageFile=request.files['file']
            filePath=imageFile.name
            saveResourceAtDirectory(uploadFile=filePath)
            prediction, confidence=makePrediction(imagePath=filePath)
            return jsonify({"status": "done", "prediction": prediction, "confidence": confidence}), 200
        else:
            return jsonify({"status": "done", "prediction": prediction, "confidence": confidence}), 200

    except:
            return jsonify({"status": "unexpected error"}), 500
        
if __name__=="__main__":
    app.run(host="127.0.0.1", 
            port=8000,
            debug=True)