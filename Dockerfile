FROM python:3.8

ADD . /code
COPY . /code
WORKDIR /code
COPY requirements.txt ./requirements.txt
RUN pip install -r requirements.txt
EXPOSE 8501

CMD [ "git", "clone https://github.com/eftSharptooth/vqgan-clip-app" ]
CMD [ "cd", "vqgan-clipp-app" ]
#RUN pip install -r requirements.txt
CMD [ "pip", "install -r requirements.txt" ]
CMD [ "git", "clone https://github.com/CompVis/taming-transformers" ]
ADD app.py /
ADD gallery.py /
#ADD logic.py /
ADD gallery_utils.py /
ADD vqgan_utils.py /
CMD [ "bash", "./download-weights.sh" ]

ENTRYPOINT ["streamlit", "run"]

CMD ["app.py"]
