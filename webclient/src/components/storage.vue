<template>
<ve-pie :data="chartData1" :settings="chartSettings"></ve-pie>
</template>

<script>
export default {
    data() {
        this.chartSettings = {
            dataType: function (v) {
                return v + " MB";
            },
            radius: 110
        };
        return {
            totalSpace:5,
            chartData1: {},
            chartData: {},
            fileData: [],
            pdfFile: 1,
            officeFile: 0,
            images: 0,
            archives: 0,
            audioAndVideos:0,
            others: 0,
            total: 0
        };
    },

    methods: {
        getAllFileData() {
            let params = {
                uid: sessionStorage.getItem("uid")
            };
            this.$http
                .post("/file/list", params)
                .then(res => {
                    if (res.data.code === 0) {
                        this.$message.error(res.data.msg);
                    } else {
                        this.fileData = res.data;
                    }
                })
                .then(() => {
                    this.reorganizeData();
                })
                .catch(err => {
                    console.log(err);
                });
        },
        reorganizeData() {
            let originalData = this.fileData;
            let office = [".doc", ".docx", ".ppt", ".pptx", ".xls", ".xlsx"];
            let images = [".jpg", ".png", ".bmp", ".tiff", ".gif"];
            //压缩包类型
            let archive = [".rar", ".zip", ".7z", ".tar", ".gz", ".xz",".bz2"];
            //音视频文件
            let audioAndVideo = [".mp4",".mpg",".flv",".rm",".rmvb",".avi",".mov",".mkv",".mp3",".flac",".aac",".ape",".wav"]
            originalData.forEach(e => {
                let size = parseInt(e.size);
                let type = e.type;
                this.total += size;
                if (type == ".pdf") {
                    this.pdfFile += size;
                } else if (office.includes(type)) {
                    this.officeFile += size;
                } else if (images.includes(type)) {
                    this.images += size;
                } else if (archive.includes(type)) {
                    this.archives += size;
                } else if (audioAndVideo.includes(type)) {
                    this.audioAndVideos += size;
                } else {
                    this.others += size;
                }
            });
            this.chartData1 = {
                columns: ["type", "space usage"],
                rows: [{
                        type: "pdf documents",
                        "space usage": (this.pdfFile / (1024 * 1024)).toFixed(2)
                    },
                    {
                        type: "office documents",
                        "space usage": (this.officeFile / (1024 * 1024)).toFixed(2)
                    },
                    {
                        type: "images",
                        "space usage": (this.images / (1024 * 1024)).toFixed(2)
                    },
                    {
                        type: "archive files",
                        "space usage": (this.archives / (1024 * 1024)).toFixed(2)
                    },
                    {
                        type: "audios & videos",
                        "space usage": (this.audioAndVideos / (1024 * 1024)).toFixed(2),
                    },
                    {
                        type: "other files",
                        "space usage": (this.others / (1024 * 1024)).toFixed(2)
                    },
                    {
                        type: "available",
                        "space usage": (100 * 1024 - this.total / (1024 * 1024)).toFixed(2)
                    }
                ]
            };
        }
    },
    mounted() {
        this.getAllFileData();
    }
};
</script>
