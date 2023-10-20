#! /bin/zsh

BUCKET_NAME="junhao"

cp() {
    aws s3 cp "$1" "s3://$BUCKET_NAME/"
}

share() {
    aws s3 cp "$1" "s3://$BUCKET_NAME/"
    url=$(aws s3 presign "s3://$BUCKET_NAME/$(basename $1)" --expires-in 604800)
    echo $url | pbcopy
    echo "share link has been copied to paste board"
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
    *)
        echo "jhaws cp/share/rm filepath"
        echo "jhaws ls"
    esac

