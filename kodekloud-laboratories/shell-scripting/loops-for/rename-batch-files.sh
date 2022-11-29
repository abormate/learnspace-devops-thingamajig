:'
We have some images under the directory /home/bob/images. Develop a script /home/bob/rename-images.sh to rename all files within the images folder that has extension jpeg to jpg. A file with any other extension should remain the same.

Tip: Use a for loop to iterate over the files within /home/bob/images

Tip: Use an if conditional to check if the file extension is jpeg.

Tip: Use mv to rename a file.

To replace jpeg to jpg in a filename use echo user1.jpeg | sed 's/jpeg/jpg/g'
'

for file in $(ls images)
do
        if [[ $file = *.jpeg ]]
                then
                new_name=$(echo $file| sed 's/jpeg/jpg/g')
                mv images/$file images/$new_name
        fi
done
