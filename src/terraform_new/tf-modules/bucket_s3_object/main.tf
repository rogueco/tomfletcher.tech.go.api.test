resource "aws_s3_object" "this" {
  bucket = var.lambda_bucket_id

  key    = var.zip_file
  source = data.archive_file.lambda_archive.output_path

  etag = filemd5(data.archive_file.lambda_archive.output_path)
}