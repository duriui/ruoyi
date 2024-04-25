
<template>

  <el-row>
  <el-table class="fixedtableHeight" v-loading="listLoading" ref="multipleTable" :data="showList" :header-cell-style="{background:'#96CDCD'}" stripe tooltip-effect="dark" style="width: 100%;margin-top:1%;">
    <el-table-column :label="item.propName" :property="item.prop" v-for="item in tableColumnList" :key="item.prop" align="center">
      <template slot-scope="scope">
        <span>{{scope.row[scope.column.property]}}</span>
      </template>
    </el-table-column>

    <el-col :span="1.5">
      <el-button
        type="success"
        plain
        icon="el-icon-edit"
        size="mini"
        :disabled="single"
        @click="handleUpdate"
        v-hasPermi="['system:config:edit']"
      >修改</el-button>
    </el-col>
    <el-col :span="1.5">
      <el-button
        type="danger"
        plain
        icon="el-icon-delete"
        size="mini"
        :disabled="multiple"
        @click="handleDelete"
        v-hasPermi="['system:config:remove']"
      >删除</el-button>
    </el-col>
  </el-table>

  </el-row>

</template>

<script>

import { getConfig, delConfig, addConfig, updateConfig, refreshCache,getDataDetail } from "@/api/system/config";
export default {
  data() {
    return {
      listLoading: false,
      showList: [],
      // 这里为了简便我就没有调用后台接口获取数据，直接写的假数据  你要用的话可以调用后台接口获取tableColumnList，注意数据格式
      tableColumnList: [{prop: 'id', propName: '编号'},
        {prop: 'name', propName: '名字'},
        {prop: 'age', propName: '保质期'},
        {prop: 'remark', propName: '特点'}],
      // 这里为了简便我就没有调用后台接口获取数据，直接写的假数据
      dataList: [{'id': '100001','name': '小红萝卜','age': '2年','remark': '适合油炸','country': '中国','address': '广东省深圳市'},
        {'id': '100002','name': '萝卜妹','age': '2年','remark': '适合水煮','country': '美国','address': '硅谷'},
        {'id': '100003','name': '胖萝卜头','age': '1年','remark': '适合玩儿','country': '泰国','address': '清迈'},
        {'id': '100004','name': '萝卜酱','age': '4年','remark': '适合吃火锅','country': '韩国','address': '首尔'}],
      optionalColumnList: [{prop: 'country', propName: '出口国家'},
        {prop: 'address', propName: '零售点'}],
      checkArr:[]
    }
  },
  created() {
    this.queryFn()
  },
  methods: {
    queryFn() {
      // 调用后台接口获取tableColumnList和dataList的方法写在这里
      // getData().then(response =>{
      //   this.tableColumnList = response.data.tableColumnList
      //   this.dataList = response.data.dataList
      // })
      this.showList = this.dataList
    },
    clearQuery() {
      this.query.name = ''
      this.queryFn()
    },
    menuChange(item){
      // 注意  我这里都用的假数据，要从后台获取tableColumnList和dataList的时候
      //，每一次调用menuChange都要重新获取tableColumnList和dataList，保证属性和数据是对应的
      let flag = true
      for(var i=0;i<this.checkArr.length;i++){
        if(this.checkArr[i] === item.propName){
          flag = false
          break
        }
      }
      if(!flag){
        this.tableColumnList.push(item)
      }
      if(flag){
        Array.prototype.contains = function(obj) {
          var j = this.length;
          while (j--) {
            if (this[j] === obj) {
              return j; // 返回的这个 i 就是元素的索引下标，
            }
          }
          return false
        }
        this.tableColumnList.splice(this.tableColumnList.contains(item),1)
      }
    },
  }
}
</script>
