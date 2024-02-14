# AWS base image for nodeJS stable version 18
FROM public.ecr.aws/lambda/nodejs:18

# export index.js to lambda
COPY index.js ${LAMBDA_TASK_ROOT}

# run index.handler
CMD [ "index.handler" ]