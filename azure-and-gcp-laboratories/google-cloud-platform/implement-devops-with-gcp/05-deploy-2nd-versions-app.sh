# ------------------------------------ #
#
# Deploy second versions of application
#
# ------------------------------------ #

# Build second development deployment

# 01 Step --
# Switch back to the dev branch.

# 02 Step -- 
# In the main.go file, update the main() function to the following
func main() {
	http.HandleFunc("/blue", blueHandler)
	http.HandleFunc("/red", redHandler)
	http.ListenAndServe(":8080", nil)
}

# 03 Step --
# Add the following function inside of the main.go file
func redHandler(w http.ResponseWriter, r *http.Request) {
	img := image.NewRGBA(image.Rect(0, 0, 100, 100))
	draw.Draw(img, img.Bounds(), &image.Uniform{color.RGBA{255, 0, 0, 255}}, image.ZP, draw.Src)
	w.Header().Set("Content-Type", "image/png")
	png.Encode(w, img)
}

: " 04 Step --
Inspect the cloudbuild-dev.yaml file to see the steps in the build process. Update the version of 
the Docker image to v2.0
"

# 05 Step --
:' Navigate to the dev/deployment.yaml file and update the container image name to the new version (v2.0)
'

# 06 Step --
: '
Make a commit with your changes on the dev branch and push changes to trigger the sample-app-dev-deploy 
build job.
' 

# 07  Step --
: '
Verify your build executed successfully, and verify the development-deployment application was 
deployed onto the dev namespace of the cluster and is using the v2.0 image
'