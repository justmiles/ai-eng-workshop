clean:
	find . -name '*.ipynb' | xargs jupyter nbconvert --clear-output --inplace

build: clean
	docker build . -t justmiles/notebook:ai-eng-workshop

publish:
	docker push justmiles/notebook:ai-eng-workshop