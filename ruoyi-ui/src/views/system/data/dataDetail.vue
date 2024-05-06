
<template>

  <el-row>
  <el-table class="fixedtableHeight" v-loading="listLoading" ref="multipleTable" :data="dataList" :header-cell-style="{background:'#96CDCD'}" stripe tooltip-effect="dark" style="width: 100%;margin-top:1%;">
    <el-table-column v-for="(column, index) in tableColumnList" :key="index" :label="column" align="center">
      <template slot-scope="scope">
        <!-- 假设数据源中的属性名与column.property匹配 -->
        <span>{{ scope.row[column] }}</span>
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

import {
  delConfig,
  updateConfig,
  getColumns,
  getData
} from "@/api/system/config";
export default {
  data() {
    return {
      detailData: null, // 存储接收到的数据
      listLoading: false,
      showList: [],
      tableColumnList: [],
      dataList: [],
      optionalColumnList: [{prop: 'country', propName: '出口国家'},
        {prop: 'address', propName: '零售点'}],
      checkArr:[]
    }
  },
  created() {
    const configId = this.$route.params.data; // 获取路由传递过来的参数
    console.log('configId:', configId);
    console.log('optionalColumnList:', this.optionalColumnList);
    this.listColumns(configId);
    this.listData(configId);
  },
  methods: {
    async listColumns(configId) {
      try {
        const response = await getColumns(configId); // 使用await等待Promise resolve
        this.tableColumnList = response.data; // 将获取到的tableColumnList赋值给tableColumnList
        console.log('columns:', this.tableColumnList); // 正确输出获取到的数据
      } catch (error) {
        console.error('Error fetching columns:', error); // 处理可能的错误
      }
    },
    async listData(configId) {
      try {
        const response = await getData(configId); // 使用await等待Promise resolve
        this.dataList = response.data; // 将获取到的data赋值给dataList
        console.log('data:', this.dataList); // 正确输出获取到的数据
      } catch (error) {
        console.error('Error fetching data:', error); // 处理可能的错误
      }
    },
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
