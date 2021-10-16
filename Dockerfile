FROM python:3.8

# streamlit-specific commands
RUN mkdir -p /root/.streamlit
RUN bash -c 'echo -e "\
[general]\n\
email = \"\"\n\
" > /root/.streamlit/credentials.toml'
RUN bash -c 'echo -e "\
[server]\n\
enableCORS = false\n\
" > /root/.streamlit/config.toml'

# exposing default port for streamlit
EXPOSE 8501


ADD . /code
WORKDIR /code
COPY requirements.txt ./requirements.txt
RUN pip3 install -r requirements.txt
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
