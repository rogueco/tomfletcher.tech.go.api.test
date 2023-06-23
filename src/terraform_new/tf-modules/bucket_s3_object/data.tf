data "archive_file" "lambda_archive" {
  type = "zip"

  source_dir  = var.publish_dir
  output_path = "${path.module}/../../${var.zip_file}"
}
