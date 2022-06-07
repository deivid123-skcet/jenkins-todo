FROM python:3.6
#Copiando os arquivos do projeto para o diretorio usr/src/app 
COPY _deivid123-skcet_jenkins-todo/ /usr/src/app
#Definindo o diretorio onde o CMD será executado e copiando o arquivo de requerimentos
WORKDIR /usr/src/app
# Instalando os requerimentos com o PIP
#RUN pip install --no-cache-dir -r requirements.txt
# Expondo a porta da APP
EXPOSE 8000
    # Fazendo a migracao inicial dos dados
RUN python manage.py makemigrations
RUN python manage.py migrate
    # Criando o superuser para acessar a app
 RUN python manage.py createsuperuser
# Executando o comando para subir a aplicacao
CMD python manage.py runserver 0:8000
#CMD ["gunicorn", "to_do.wsgi:application", "--bind", "0.0.0.0:8000", "--workers", "3"]
