FROM python:3.10-trixie

WORKDIR /NLP_ENV

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY *.csv .

COPY . .

