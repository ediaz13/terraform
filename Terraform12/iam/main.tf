provider "aws" {
    region = "sa-east-1"
}

resource "aws_iam_user" "myUser" {
    name = "Mogul"
}

resource "aws_iam_policy" "customPolicy" {
  name = "GlacierEFSEC"

  policy = <<EOF
cls{
	"Version": "2012-10-17",
	"Statement": [
		{
			"Sid": "Statement1",
			"Effect": "Allow",
			"Action": [
				"glacier:ListJobs",
				"glacier:ListMultipartUploads",
				"glacier:ListParts",
				"glacier:ListProvisionedCapacity",
				"glacier:ListTagsForVault",
				"glacier:ListVaults",
				"glacier:DescribeJob",
				"glacier:DescribeVault",
				"glacier:GetDataRetrievalPolicy",
				"glacier:GetJobOutput",
				"glacier:GetVaultLock",
				"glacier:GetVaultNotifications",
				"glacier:AbortMultipartUpload",
				"glacier:CompleteMultipartUpload",
				"glacier:CreateVault",
				"glacier:DeleteArchive",
				"glacier:DeleteVault",
				"glacier:DeleteVaultNotifications",
				"glacier:InitiateJob",
				"glacier:InitiateMultipartUpload",
				"glacier:PurchaseProvisionedCapacity",
				"glacier:SetVaultNotifications",
				"glacier:UploadArchive",
				"glacier:UploadMultipartPart",
				"glacier:AbortVaultLock",
				"glacier:CompleteVaultLock",
				"glacier:DeleteVaultAccessPolicy",
				"glacier:InitiateVaultLock",
				"glacier:SetDataRetrievalPolicy",
				"glacier:SetVaultAccessPolicy",
				"glacier:AddTagsToVault",
				"glacier:RemoveTagsFromVault",
				"elasticfilesystem:DescribeAccessPoints",
				"elasticfilesystem:DescribeAccountPreferences",
				"elasticfilesystem:DescribeReplicationConfigurations",
				"elasticfilesystem:DescribeBackupPolicy",
				"elasticfilesystem:DescribeFileSystemPolicy",
				"elasticfilesystem:DescribeLifecycleConfiguration",
				"elasticfilesystem:DescribeMountTargets",
				"elasticfilesystem:DescribeMountTargetSecurityGroups",
				"elasticfilesystem:DescribeTags",
				"elasticfilesystem:ListTagsForResource",
				"elasticfilesystem:Backup",
				"elasticfilesystem:ClientRootAccess",
				"elasticfilesystem:ClientWrite",
				"elasticfilesystem:CreateAccessPoint",
				"elasticfilesystem:CreateFileSystem",
				"elasticfilesystem:CreateMountTarget",
				"elasticfilesystem:CreateReplicationConfiguration",
				"elasticfilesystem:DeleteAccessPoint",
				"elasticfilesystem:DeleteFileSystem",
				"elasticfilesystem:DeleteMountTarget",
				"elasticfilesystem:DeleteReplicationConfiguration",
				"elasticfilesystem:ModifyMountTargetSecurityGroups",
				"elasticfilesystem:PutAccountPreferences",
				"elasticfilesystem:PutBackupPolicy",
				"elasticfilesystem:PutLifecycleConfiguration",
				"elasticfilesystem:Restore",
				"elasticfilesystem:UpdateFileSystem",
				"elasticfilesystem:UpdateFileSystemProtection",
				"elasticfilesystem:DeleteFileSystemPolicy",
				"elasticfilesystem:PutFileSystemPolicy",
				"elasticfilesystem:CreateTags",
				"elasticfilesystem:DeleteTags",
				"elasticfilesystem:TagResource",
				"elasticfilesystem:UntagResource"
			],
			"Resource": "*"
		}
	]
  }
  EOF
}

resource "aws_iam_policy_attachment" "policyBind" {
  name = "attachment"
  users = [aws_iam_user.myUser.name]
  policy_arn = aws_iam_policy.customPolicy.arn
}
