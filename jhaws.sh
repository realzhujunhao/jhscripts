#! /bin/zsh

BUCKET_NAME="junhao"

cp() {
    local file_path="$1"
    aws s3 cp "$file_path" "s3://$BUCKET_NAME/"
}

presign_and_copy() {
    local file_path="$1"
    url=$(aws s3 presign "s3://$BUCKET_NAME/$(basename $file_path)" --expires-in 604800)
    echo $url | pbcopy
    echo "share link has been copied to paste board"
}

share() {
    local file_path="$1"
    cp "$file_path"
    presign_and_copy "$file_path"
}

link() {
    local file_path="$1"
    presign_and_copy "$file_path"
}

rm() {
    aws s3 rm "s3://$BUCKET_NAME/$1"
}

ls() {
    aws s3 ls "$BUCKET_NAME"
}

case $1 in
    cp)
        cp $2
        ;;
    share)
        share $2
        ;;
    rm)
        rm $2
        ;;
    ls)
        ls
        ;;
    link)
        link $2
        ;;
    *)
        echo "jhaws cp/share/rm filepath"
        echo "jhaws ls"
    esac

