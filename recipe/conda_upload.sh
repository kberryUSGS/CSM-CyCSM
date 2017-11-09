conda config --set anaconda_upload yes
conda build --token $CONDA_UPLOAD_TOKEN .
