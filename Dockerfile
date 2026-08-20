FROM python:3.10-trixie

WORKDIR /NLP_ENV

COPY requirements.txt .

COPY *.csv .

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 8888

COPY . .

# Start Jupyter Notebook server.
# --ip=0.0.0.0: Listens on all container network interfaces so external connections (like host VS Code) are accepted.
#--no-browser: Prevents Docker from trying to open a web browser window inside the headless container.
#--allow-root: Allows Jupyter to run as the default root user inside Docker.
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--ServerApp.allow_origin='*'"]