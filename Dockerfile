FROM python:3.8
ADD . /code
WORKDIR /code
ADD app.py /
ADD gallery.py /
ADD logic.py /
ADD gallery_utils.py /
ADD logic_utils.py /

RUN pip install pytorch=1.8.1
RUN pip install torchvision=0.9.1
RUN pip install torchaudio=0.8.1
RUN pip install cudatoolkit=10.2
RUN pip install omegaconf
RUN pip install pytorch-lightning
RUN pip install tqdm
RUN pip install regex
RUN pip install kornia
RUN pip install ftfy
RUN pip install pillow=7.1.2
RUN pip install python=3.8
RUN pip install imageio-ffmpeg=0.2.0
RUN pip install ipykernel
RUN pip install imageio
RUN pip install ipywidgets
RUN pip install streamlit
RUN pip install ffmpeg
RUN pip install pyyaml
RUN pip install flask
RUN pip install einops
RUN pip install transformers
RUN pip install 

CMD [ "git", "clone https://github.com/eftSharptooth/vqgan-clip-app" ]
CMD [ "cd", "vqgan-clipp-app" ]
CMD [ "git", "clone https://github.com/CompVis/taming-transformers" ]
CMD [ "bash", "./download-weights.sh" ]
CMD [ "streamlit", "run app.py" ]
