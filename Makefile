clean:
	find . -name '*.ipynb' | xargs jupyter nbconvert --clear-output --inplace

build: clean
	docker build . -t justmiles/ai-eng-workshop:latest

publish:
	docker push justmiles/ai-eng-workshop:latest