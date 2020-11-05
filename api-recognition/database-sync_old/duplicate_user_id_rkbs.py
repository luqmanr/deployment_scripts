import os, shutil
from pathlib import Path

user_id_rkbs = ["1259-6118-4124-8623",
"4739-5447-3861-6803",
"8031-9613-1268-6089",
"3768-0031-9845-6364",
"6907-2196-0069-569",
"6378-3124-3160-0025",
"3926-9665-6157-3865",
"3301-2552-5957-3333",
"9925-5479-6606-0635",
"8222-5580-1041-5039",
"3957-9960-7985-3580",
"1235-5126-7601-9597",
"4584-6608-6154-9353",
"2376-9271-3425-3832",
"6018-9146-8289-2499",
"9578-0651-0040-838",
"6167-0575-7191-825",
"1468-5579-8264-6363"]

## 0. Set cluster sumber, dan cluster tujuan
source_cluster = "Trial"
destination_cluster = "indocisc"

## 1. Copy semua image file `user_id_rkb` yang diinginkan
image_data_dir = "/home/riset-ai/workspace/face-recognition/v1.0/media/data_face_mask"
image_modes = ["nomask", "mask"]

for image_mode in image_modes:
    source_cluster_path = os.path.join(image_data_dir, ("%s/%s" % (source_cluster, image_mode)))
    destination_cluster_path = os.path.join(image_data_dir, ("%s/%s" % (destination_cluster, image_mode)))

    for user_id_rkb in user_id_rkbs:
        try:
            src_path = os.path.join(source_cluster_path, user_id_rkb)
            dst_path = os.path.join(destination_cluster_path, user_id_rkb)
            shutil.copytree(src_path, dst_path)
            print("%s copied to %s" % (user_id_rkb, dst_path))
        except:
            print("%s doesn't exist in cluster, or destination folder doesn't exist" % user_id_rkb)

## 2. Copy `.csv` dari cluster lain, supaya bisa `manual_train.py`
csv_data_dir = "/home/riset-ai/workspace/face-recognition/v1.0/media/csv_database_mask"

try:
    src_path = os.path.join(csv_data_dir, source_cluster)
    dst_path = os.path.join(csv_data_dir, destination_cluster)
    csv_files = os.listdir(dst_path)
    print("%s copied to %s" % (str(csv_files), dst_path))
except:
    print(".csv file doesn't exist in cluster, or destination folder doesn't exist")

shutil.copytree(src_path, dst_path)