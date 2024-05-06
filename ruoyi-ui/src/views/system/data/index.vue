<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="数据名称" prop="configName">
        <el-input
          v-model="queryParams.configName"
          placeholder="请输入数据名称"
          clearable
          style="width: 240px"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>

      <el-form-item label="创建时间">
        <el-date-picker
          v-model="dateRange"
          style="width: 240px"
          value-format="yyyy-MM-dd"
          type="daterange"
          range-separator="-"
          start-placeholder="开始日期"
          end-placeholder="结束日期"
        ></el-date-picker>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['system:config:add']"
        >新增</el-button>
      </el-col>
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
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:config:export']"
        >导出</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-refresh"
          size="mini"
          @click="handleRefreshCache"
          v-hasPermi="['system:config:remove']"
        >刷新缓存</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="configList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />

      <el-table-column label="数据名称" align="center" prop="configName" :show-overflow-tooltip="true">
        <template slot-scope="scope">
          <span style="color: #1890ff; cursor: pointer;" @click="handleQueryDetail(scope.row)" >{{ scope.row.configName }}</span>
        </template>
      </el-table-column>


      <el-table-column label="创建时间" align="center" prop="createTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.createTime) }}</span>
        </template>
      </el-table-column>
      <el-table-column label="更新时间" align="center" prop="updateTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.updateTime) }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-plus"
            @click="handleAddData(scope.row)"
            v-hasPermi="['system:config:add']"
          >新增一条数据</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:config:edit']"
          >修改名称</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:config:remove']"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改新增一条数据配置对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="120px">
        <el-form-item v-for="(value, columnName) in columns" :key="columnName" :label="value">
          <template v-if="columnName.includes('1')">
            <el-input
              v-model="form.data1"
              type="textarea"
              placeholder="请输入内容"
              style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"
            />
          </template>
          <template v-if="columnName.includes('2')">
            <el-input
              v-model="form.data2"
              type="textarea"
              placeholder="请输入内容"
              style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"
            />
          </template>
          <template v-if="columnName.includes('3')">
            <el-input
              v-model="form.data3"
              type="textarea"
              placeholder="请输入内容"
              style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"
            />
          </template>
          <template v-if="columnName.includes('4')">
            <el-input
              v-model="form.data4"
              type="textarea"
              placeholder="请输入内容"
              style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"
            />
          </template>
          <template v-if="columnName.includes('5')">
            <el-input
              v-model="form.data5"
              type="textarea"
              placeholder="请输入内容"
              style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"
            />
          </template>
          <template v-if="columnName.includes('6')">
            <el-input
              v-model="form.data6"
              type="textarea"
              placeholder="请输入内容"
              style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"
            />
          </template>
          <template v-if="columnName.includes('7')">
            <el-input
              v-model="form.data7"
              type="textarea"
              placeholder="请输入内容"
              style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"
            />
          </template>
          <template v-if="columnName.includes('8')">
            <el-input
              v-model="form.data8"
              type="textarea"
              placeholder="请输入内容"
              style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"
            />
          </template>
          <template v-if="columnName.includes('9')">
            <el-input
              v-model="form.data9"
              type="textarea"
              placeholder="请输入内容"
              style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"
            />
          </template>
          <template v-if="columnName.includes('10')">
            <el-input
              v-model="form.data10"
              type="textarea"
              placeholder="请输入内容"
              style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"
            />
          </template>
          <template v-if="columnName.includes('11')">
            <el-input
              v-model="form.data11"
              type="textarea"
              placeholder="请输入内容"
              style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"
            />
          </template>
          <template v-if="columnName.includes('12')">
            <el-input
              v-model="form.data12"
              type="textarea"
              placeholder="请输入内容"
              style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"
            />
          </template>
          <template v-if="columnName.includes('13')">
            <el-input
              v-model="form.data13"
              type="textarea"
              placeholder="请输入内容"
              style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"
            />
          </template>
          <template v-if="columnName.includes('14')">
            <el-input
              v-model="form.data14"
              type="textarea"
              placeholder="请输入内容"
              style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"
            />
          </template>
          <template v-if="columnName.includes('15')">
            <el-input
              v-model="form.data15"
              type="textarea"
              placeholder="请输入内容"
              style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"
            />
          </template>
          <template v-if="columnName.includes('16')">
            <el-input
              v-model="form.data16"
              type="textarea"
              placeholder="请输入内容"
              style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"
            />
          </template>
          <template v-if="columnName.includes('17')">
            <el-input
              v-model="form.data17"
              type="textarea"
              placeholder="请输入内容"
              style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"
            />
          </template>
          <template v-if="columnName.includes('18')">
            <el-input
              v-model="form.data18"
              type="textarea"
              placeholder="请输入内容"
              style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"
            />
          </template>
          <template v-if="columnName.includes('19')">
            <el-input
              v-model="form.data19"
              type="textarea"
              placeholder="请输入内容"
              style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"
            />
          </template>
          <template v-if="columnName.includes('20')">
            <el-input
              v-model="form.data20"
              type="textarea"
              placeholder="请输入内容"
              style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"
            />
          </template>
        </el-form-item>
      </el-form>

      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>

      </div>
    </el-dialog>

    <!-- 添加或修改修改名称配置对话框 -->
    <el-dialog :title="title" :visible.sync="open1" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="数据名称" prop="configName">
          <el-input
            v-model="form.configName"
            type="textarea"
            placeholder="请输入内容"
            style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"
          />
        </el-form-item>
      </el-form>

      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm1">确 定</el-button>
        <el-button @click="cancel1">取 消</el-button>
      </div>
    </el-dialog>

    <!-- 添加或修改新增一种数据配置对话框 -->
    <el-dialog :title="title" :visible.sync="open2" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">

        <el-form-item label="数据名称" prop="configName">
          <el-input
            v-model="form.configName"
            type="textarea"
            placeholder="请输入内容"
            style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"
          />
        </el-form-item>

        <el-form-item label="列名" prop="column1">
          <el-input
            v-model="form.column1"
            type="textarea"
            placeholder="请输入内容"
            style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"
          />
        </el-form-item>

        <el-form-item label="列名" prop="column2">
          <el-input
            v-model="form.column2"
            type="textarea"
            placeholder="请输入内容"
            style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"
          />
        </el-form-item>

        <el-form-item label="列名" prop="column3">
          <el-input
            v-model="form.column3"
            type="textarea"
            placeholder="请输入内容"
            style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"
          />
        </el-form-item>

        <el-form-item label="列名" prop="column4">
          <el-input
            v-model="form.column4"
            type="textarea"
            placeholder="请输入内容"
            style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"
          />
        </el-form-item>

        <el-form-item label="列名" prop="column5">
          <el-input
            v-model="form.column5"
            type="textarea"
            placeholder="请输入内容"
            style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"
          />
        </el-form-item>

        <el-form-item label="列名" prop="column6">
          <el-input
            v-model="form.column6"
            type="textarea"
            placeholder="请输入内容"
            style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"
          />
        </el-form-item>

        <el-form-item label="列名" prop="column7">
          <el-input
            v-model="form.column7"
            type="textarea"
            placeholder="请输入内容"
            style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"
          />
        </el-form-item>

        <el-form-item label="列名" prop="column8">
          <el-input
            v-model="form.column8"
            type="textarea"
            placeholder="请输入内容"
            style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"
          />
        </el-form-item>

        <el-form-item label="列名" prop="column9">
          <el-input
            v-model="form.column9"
            type="textarea"
            placeholder="请输入内容"
            style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"
          />
        </el-form-item>

        <el-form-item label="列名" prop="column10">
          <el-input
            v-model="form.column10"
            type="textarea"
            placeholder="请输入内容"
            style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"
          />
        </el-form-item>

        <el-form-item label="列名" prop="column11">
          <el-input
            v-model="form.column11"
            type="textarea"
            placeholder="请输入内容"
            style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"
          />
        </el-form-item>

        <el-form-item label="列名" prop="column12">
          <el-input
            v-model="form.column12"
            type="textarea"
            placeholder="请输入内容"
            style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"
          />
        </el-form-item>

        <el-form-item label="列名" prop="column13">
          <el-input
            v-model="form.column13"
            type="textarea"
            placeholder="请输入内容"
            style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"
          />
        </el-form-item>

        <el-form-item label="列名" prop="column14">
          <el-input
            v-model="form.column14"
            type="textarea"
            placeholder="请输入内容"
            style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"
          />
        </el-form-item>

        <el-form-item label="列名" prop="column15">
          <el-input
            v-model="form.column15"
            type="textarea"
            placeholder="请输入内容"
            style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"
          />
        </el-form-item>

        <el-form-item label="列名" prop="column16">
          <el-input
            v-model="form.column16"
            type="textarea"
            placeholder="请输入内容"
            style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"
          />
        </el-form-item>

        <el-form-item label="列名" prop="column17">
          <el-input
            v-model="form.column17"
            type="textarea"
            placeholder="请输入内容"
            style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"
          />
        </el-form-item>

        <el-form-item label="列名" prop="column18">
          <el-input
            v-model="form.column18"
            type="textarea"
            placeholder="请输入内容"
            style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"
          />
        </el-form-item>

        <el-form-item label="列名" prop="column19">
          <el-input
            v-model="form.column19"
            type="textarea"
            placeholder="请输入内容"
            style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"
          />
        </el-form-item>

        <el-form-item label="列名" prop="column20">
          <el-input
            v-model="form.column20"
            type="textarea"
            placeholder="请输入内容"
            style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"
          />
        </el-form-item>
      </el-form>

      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm2">确 定</el-button>
        <el-button @click="cancel2">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<style scoped>
.el-form-item__label {
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}
</style>

<script>
import {
  listConfig,
  getConfig,
  delConfig,
  addConfig,
  updateConfig,
  refreshCache,
  getDataDetail,
  addData, getConfigName, addOneData, getColumns, getData
} from "@/api/system/config";

export default {
  name: "Config",
  dicts: ['sys_yes_no'],
  data() {
    return {

      // 列名
      columns: [], // 初始化为空，后端返回后填充
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 参数表格数据
      configList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 日期范围
      dateRange: [],
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        configName: undefined,
        configKey: undefined,
        configType: undefined
      },

      // 表单参数
      form: {
        configName: '',
        remark: '',
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
        data20: '',
        column1: '',
        column2: '',
        column3: '',
        column4: '',
        column5: '',
        column6: '',
        column7: '',
        column8: '',
        column9: '',
        column10: '',
        column11: '',
        column12: '',
        column13: '',
        column14: '',
        column15: '',
        column16: '',
        column17: '',
        column18: '',
        column19: '',
        column20: ''
      },
      // 表单校验
      rules: {
        configName: [
          { required: true, message: "数据名称不能为空", trigger: "blur" }
        ]
      }
    };
  },
  async created() {
    this.getList();
  },



  methods: {
    /** 查询参数列表 */
    getList() {
      this.loading = true;
      listConfig(this.addDateRange(this.queryParams, this.dateRange)).then(response => {
          this.configList = response.rows;
          this.total = response.total;
          this.loading = false;
        }
      );
    },
    // 新增一条数据的取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },

    // 修改数据名称的取消按钮
    cancel1() {
      this.open1 = false;
      this.reset();
    },

    // 新增一种数据的取消按钮
    cancel2() {
      this.open2 = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        configId: undefined,
        configName: undefined,
        configKey: undefined,
        configValue: undefined,
        configType: "Y",
        remark: undefined
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.dateRange = [];
      this.resetForm("queryForm");
      this.handleQuery();
    },
    /** 新增一种数据按钮操作 */
    handleAdd() {
      this.reset();
      this.open2 = true;
      this.title = "新增一种数据";
    },

    /** 新增一条数据按钮操作 */
    handleAddData(row) {
      this.reset();
      const configId = row.configId || this.ids
      getColumns(configId).then(response => {
        this.columns = response.data;
        console.log(this.columns)
      });
      getConfigName(configId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "新增一条数据";
      });
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.configId)
      this.single = selection.length!=1
      this.multiple = !selection.length
    },
    /** 查看数据详情操作 */
    handleQueryDetail(row) {
      this.reset();
      const configId = row.configId || this.ids
      // 使用路由传递数据到另一个页面
      this.$router.push({
        name:'dataDetail',
        params:{data: configId}
      })
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const configId = row.configId || this.ids
      getConfig(configId).then(response => {
        this.form = response.data;
        this.open1 = true;
        this.title = "修改数据";
      });
    },
    /** 修改名称提交按钮 */
    submitForm1: function() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.configId != undefined) {
            updateConfig(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open1 = false;
              this.getList();
            });
          } else {
            addOneData(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open1 = false;
              this.getList();
            });
          }
        }
      });
    },

    /** 新增一种数据提交按钮 */
    submitForm2: function () {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.configId == undefined) {
            addData(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open2 = false;
              this.getList();
            });
          }
        }
      });
    },

    /** 新增一条数据提交按钮 */
    submitForm: function() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (!this.form.configId != undefined) {
            addOneData(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          } else {
            addOneData(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const configIds = row.configId || this.ids;
      this.$modal.confirm('是否确认删除所选数据项？').then(function() {
        return delConfig(configIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/config/export', {
        ...this.queryParams
      }, `config_${new Date().getTime()}.xlsx`)
    },
    /** 刷新缓存按钮操作 */
    handleRefreshCache() {
      refreshCache().then(() => {
        this.$modal.msgSuccess("刷新成功");
      });
    }
  }
};
</script>
