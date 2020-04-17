<template>
<div>
    <pdf ref="pdf" :src="url" :page="currentPage" @num-pages="pageCount = $event" @page-loaded="currentPage = $event">

    </pdf>
    <div style="text-align:center;margin-bottom:20px;margin-top:20px;font-size:18px;height:30px;">
        <i class="el-icon-d-arrow-left" @click="prePage" />
        <span>{{currentPage}} / {{pageCount}}</span>
        <i class="el-icon-d-arrow-right" @click="nextPage" />
    </div>
</div>
</template>

<script>
import pdf from 'vue-pdf';
export default {
    props: {
        url: String,
        page: Number,
        //pageCount:Number,
        //currentPage:Number
    },
    name: 'preview',
    components: {
        pdf
    },
    data() {
        return {
            currentPage: 1,
            pageCount: 0
            //url: 'http://localhost:8081/file/download/0cc175b9c0f1b6a831c399e269772661.pdf/374'

        }
    },
    methods: {
        prePage() {
            var p = this.currentPage
            p = p > 1 ? p - 1 : this.pageCount
            this.currentPage = p
        },
        nextPage() {
            var p = this.currentPage
            p = p < this.pageCount ? p + 1 : 1
            this.currentPage = p
        },

    },
    mounted() {

    }
}
</script>

<style scoped>
.icon {
    height: 50px;
}
</style>
