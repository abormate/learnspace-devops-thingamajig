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

