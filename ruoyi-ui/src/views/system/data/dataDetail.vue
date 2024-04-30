
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
      detailData: null, // 存储接收到的数据
      listLoading: false,
      showList: [],
      // 这里为了简便我就没有调用后台接口获取数据，直接写的假数据  你要用的话可以调用后台接口获取tableColumnList，注意数据格式
      tableColumnList: [],
      // 这里为了简便我就没有调用后台接口获取数据，直接写的假数据
      dataList: [],
      optionalColumnList: [{prop: 'country', propName: '出口国家'},
        {prop: 'address', propName: '零售点'}],
      checkArr:[]
    }
  },
  created() {
    const rawDetailData = this.$route.params.data; // 获取路由传递过来的参数
    console.log('rawDetailData:', rawDetailData);
    // 对数据进行处理
    this.tableColumnList = this.generateTableColumnList(this.transformDataForColumn(rawDetailData));
    this.dataList = this.generateTableDataList(this.transformDataForData(rawDetailData));
    console.log('tableColumnList:', this.tableColumnList);
    console.log('dataList:', this.dataList);
  },
  methods: {
    transformDataForColumn(data) {
      return data.map(item => {
        const filteredItem = {};
        // 遍历对象的每个键，检查是否以 'colum' 开头
        Object.keys(item).forEach(key => {
          if (key.startsWith('colum') && item[key] !== null) {
            filteredItem[key] = item[key];
          }
        });
        return filteredItem;
      });
    },
    generateTableColumnList(filteredData) {
      if (filteredData.length > 0) {
        // 假设所有对象具有相同的键集合，所以我们只查看第一个对象
        const keyValuePairs = Object.entries(filteredData[0]);
        return keyValuePairs.map(([key, value]) => ({
          prop: key,
          propName: value.toString() // 将值转换为字符串
        }));
      }
      return [];
    },
    transformDataForData(data) {
      return data.map(item => {
        const filteredItem = {};
        // 遍历对象的每个键，检查是否以 'data' 开头
        Object.keys(item).forEach(key => {
          if (key.startsWith('data') && item[key] !== null) {
            filteredItem[key] = item[key];
          }
        });
        return filteredItem;
      });
    },
    generateTableDataList(filteredData) {
      if (filteredData.length > 0) {
        // 假设所有对象具有相同的键集合，所以我们只查看第一个对象
        const keyValuePairs = Object.entries(filteredData[0]);
        return keyValuePairs.map(([key, value]) => ({
          prop: key,
          propName: value.toString() // 将值转换为字符串
        }));
      }
      return [];
    },
    handleUpdate() {
      // 调用后台接口修改数据的方法写在这里
      updateConfig(this.detailData).then(response => {
        this.$message.success('修改成功')
        this.$router.push({ path: '/system/config/data' })
      })
    },
    handleDelete() {
      // 调用后台接口删除数据的方法写在这里
      delConfig(this.detailData).then(response => {
        this.$message.success('删除成功')
        this.$router.push({ path: '/system/config/data' })
      })
    },

    queryFn() {
      // 调用后台接口获取tableColumnList和dataList的方法写在这里
      getData().then(response =>{
        this.tableColumnList = response.data.tableColumnList
        this.dataList = response.data.dataList
      })
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
