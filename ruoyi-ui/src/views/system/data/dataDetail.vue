<template>
  <div  class="app-container">
  <el-table  class="fixedtableHeight" v-loading="listLoading" ref="multipleTable" :data="dataList" :header-cell-style="{background:'#96CDCD'}" stripe tooltip-effect="dark" style="width: 100%;margin-top:1%;">
    <el-table-column  v-for="(column, index) in tableColumnList" :key="index" :label="column" align="center">
      <template slot-scope="scope">
        <!-- 假设数据源中的属性名与column匹配 -->
        <span>{{ scope.row[columnMapping[index]] }}</span>
      </template>
    </el-table-column>

    <el-row>
    <el-table-column  label="操作" width="180" align="center">
      <template slot-scope="scope">
        <!-- 修改按钮 -->
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          @click="handleUpdate(scope.row)"
          v-hasPermi="['system:config:edit']">修改
        </el-button>

        <!-- 删除按钮 -->
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          @click="handleDelete(scope.row)"
          v-hasPermi="['system:config:remove']">删除
        </el-button>
      </template>
    </el-table-column>
    </el-row>
  </el-table>
    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getDataList"
    />


    <!-- 添加或修改修改名称配置对话框 -->
    <el-dialog  :title="title" :visible.sync="open3" width="500px" append-to-body>
      <el-form ref="form" :model="form"  label-width="120px">
        <!-- 使用columnMapping映射列名查找数据 -->
          <el-form-item v-for="(column, prop) in tableColumnList" :key="prop" :label="column" style="margin-bottom: 10px;">
              <el-input
                v-model="form[columnMapping[prop]]"
                type="textarea"
                placeholder="请输入内容"
                style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"
              />
          </el-form-item>

      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitFormUpdate">确 定</el-button>
        <el-button @click="cancelUpdate">取 消</el-button>
      </div>
    </el-dialog>
  </div>

</template>

<script>

import {
  addOneData,
  delData,
  getColumns,
  getData,
  getSingleData, updateSingleData
} from "@/api/system/config";
export default {
  data() {
    return {
      // 总条数
      total: 0,
      // 弹出层标题
      title: "",
      configId: null,
      // 是否显示弹出层
      open3: false,
      open4: false,
      open5: false,
      listLoading: true,
      showList: [],
      tableColumnList: [],
      dataList: [],
      singleData: [],
      checkArr:[],
      columnMapping: {
        // 列名与数据对象属性的映射关系
        "column1": "data1",
        "column2": "data2",
        "column3": "data3",
        "column4": "data4",
        "column5": "data5",
        "column6": "data6",
        "column7": "data7",
        "column8": "data8",
        "column9": "data9",
        "column10": "data10",
        "column11": "data11",
        "column12": "data12",
        "column13": "data13",
        "column14": "data14",
        "column15": "data15",
        "column16": "data16",
        "column17": "data17",
        "column18": "data18",
        "column19": "data19",
        "column20": "data20"
      },
      // 表单参数
      form: {
        data1: '',
        data2: '',
        data3: '',
        data4: '',
        data5: '',
        data6: '',
        data7: '',
        data8: '',
        data9: '',
        data10: '',
        data11: '',
        data12: '',
        data13: '',
        data14: '',
        data15: '',
        data16: '',
        data17: '',
        data18: '',
        data19: '',
        data20: ''
      },
      queryParams: {
        pageNum: 1,
        pageSize: 10
      },
    }
  },
  created() {
    this.getDataList();
  },
  methods: {
    /** 查询数据列表 */
    getDataList() {
      this.listLoading = true;
      this.configId = this.$route.params.data; // 获取路由传递过来的参数
      if(this.configId){
        localStorage.setItem("configId", this.configId);
      }else{
        this.configId = localStorage.getItem("configId");
      }
      if(this.configId){
        console.log('configId:', this.configId);
        this.listColumns(this.configId);
        this.listData(this.configId);

      }else{
        console.error('configId is missing');
      }
      this.listLoading = false;
    },
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
        console.log('datalist:', this.dataList); // 正确输出获取到的数据
      } catch (error) {
        console.error('Error fetching data:', error); // 处理可能的错误
      }
    },
    handleUpdate(row) {
        const id = row.id
        getSingleData(id).then(response => {
          this.form = response.data;
          this.open3 = true;
          console.log("this.form:", this.form);
          console.log("this.form:", this.form.data1);
          this.title = "修改数据";
        });
      },
    handleDelete(row) {
      // 调用后台接口删除数据的方法写在这里
      const ids = row.id;
      this.$modal.confirm('是否确认删除所选数据项？').then(function() {
        return delData(ids);
      }).then(() => {
        this.getDataList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 修改名称提交按钮 */
    submitFormUpdate: function () {
      console.log("this.form:", this.form);
      // if (this.singleData.id != undefined) {
        updateSingleData(this.form).then(response => {
          this.$modal.msgSuccess("修改成功");
          this.open3 = false;
          this.getDataList();
        });
      // }
   },
    // 修改数据的取消按钮
    cancelUpdate() {
      this.open3 = false;
    },
    // 删除数据的取消按钮
    cancel4() {
      this.open4 = false;
    }
  }
}
</script>
