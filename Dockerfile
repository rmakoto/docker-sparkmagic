FROM jupyter/scipy-notebook

USER root

# This is needed because requests-kerberos fails to install on debian due to missing linux headers
RUN conda install requests-kerberos -y

USER $NB_USER

RUN pip install --upgrade pip
RUN pip install sparkmagic \
                autovizwidget \
                hdijupyterutils

RUN mkdir /home/$NB_USER/.sparkmagic
COPY example_config.json /home/$NB_USER/.sparkmagic/config.json
RUN sed -i 's/localhost/spark/g' /home/$NB_USER/.sparkmagic/config.json

RUN jupyter nbextension enable --py --sys-prefix widgetsnbextension
RUN jupyter-kernelspec install --user $(pip show sparkmagic | grep Location | cut -d" " -f2)/sparkmagic/kernels/sparkkernel
RUN jupyter-kernelspec install --user $(pip show sparkmagic | grep Location | cut -d" " -f2)/sparkmagic/kernels/pysparkkernel
RUN jupyter-kernelspec install --user $(pip show sparkmagic | grep Location | cut -d" " -f2)/sparkmagic/kernels/sparkrkernel
RUN jupyter serverextension enable --py sparkmagic

USER root
RUN chown $NB_USER /home/$NB_USER/.sparkmagic/config.json

CMD ["start-notebook.sh", "--NotebookApp.iopub_data_rate_limit=1000000000"]

USER $NB_USER