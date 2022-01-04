<demo>
常规使用
</demo>

<template>
  <div>Tabs 示例</div>
  <h1>示例1</h1>
  <Tabs v-model:selected="x">
    <Tab title="导航1">内容1</Tab>
    <Tab title="导航2">内容2</Tab>
  </Tabs>
</template>

<script lang="ts">
import {Tabs, Tab} from '../lib/index'
import {ref} from "vue";

export default {
  setup() {
    const x = ref('导航1')
    return {
      x
    }
  },
  components: {
    Tabs,
    Tab,
  }
}
</script>
