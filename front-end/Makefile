#======================#
# Install, clean, test #
#======================#

install_requirements:
	@pip install -r requirements.txt

install:
	@pip install . -U

clean:
	@rm -f */version.txt
	@rm -f .coverage
	@rm -fr */__pycache__ */*.pyc __pycache__
	@rm -fr build dist
	@rm -fr proj-*.dist-info
	@rm -fr proj.egg-info



#======================#
#       Streamlit      #
#======================#

streamlit: streamlit_local

streamlit_local:
	-@API=local_api_uri streamlit run app.py

streamlit_local_docker:
	-@API=local_docker_uri streamlit run app.py

streamlit_cloud:
	-@API=cloud_api_uri streamlit run app.py
