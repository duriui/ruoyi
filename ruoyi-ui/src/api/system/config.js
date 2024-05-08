import request from '@/utils/request'

// 查询参数列表
export function listConfig(query) {
  return request({
    url: '/system/config/list',
    method: 'get',
    params: query
  })
}

// 查询数据详细
export function getData(configId) {
  return request({
    url: '/system/config/data/' + configId,
    method: 'get'
  })
}

// 根据ids获取数据
export function getSingleData(id) {
  return request({
    url: '/system/config/singleData/' + id,
    method: 'get'
  })
}

export function updateSingleData(data) {
  return request({
    url: '/system/config/singleData',
    method: 'put',
    data: data
  })
}

// 查询参数详细
export function getConfig(configId) {
  return request({
    url: '/system/config/' + configId,
    method: 'get'
  })
}

/**
 * 根据参数ID查询数据模版的列名
 * @param configId
 * @returns {*}
 */
export function getColumns(configId) {
  return request({
    url: '/system/config/columns/' + configId,
    method: 'get'
  })
}



// 查询参数详细
export function getConfigName(configId) {
  return request({
    url: '/system/config/name/' + configId,
    method: 'get'
  })
}





// 根据参数键名查询参数值
export function getConfigKey(configKey) {
  return request({
    url: '/system/config/configKey/' + configKey,
    method: 'get'
  })
}

// 新增一种数据
export function addData(data) {
  return request({
    url: '/system/config/add',
    method: 'post',
    data: data
  })
}

// 新增一条数据
export function addOneData(data) {
  return request({
    url: '/system/config/addOne',
    method: 'post',
    data: data
  })
}

// 修改参数配置
export function updateConfig(data) {
  return request({
    url: '/system/config',
    method: 'put',
    data: data
  })
}

// 删除一种数据模板
export function delConfig(configId) {
  return request({
    url: '/system/config/' + configId,
    method: 'delete'
  })
}

// 删除参数配置
export function delData(configId) {
  return request({
    url: '/system/config/data/' + configId,
    method: 'delete'
  })
}

// 刷新参数缓存
export function refreshCache() {
  return request({
    url: '/system/config/refreshCache',
    method: 'delete'
  })
}
