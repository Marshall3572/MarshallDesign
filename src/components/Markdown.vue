<template>
  <article class="markdown-body" v-html="content"></article>
</template>


<script lang="ts">
import {ref} from "vue";

export default {
  props: {
    content: {
      type: String,
      required: true
    }
  },
  // setup(props) {
  //   const content = ref<string>(null)
  //   // import md from '../markdown/get-started.md';
  //   // 动态引入，但这是异步加载
  //   import(props.path).then(res => {
  //     // 动态引入的对象有一个default属性
  //     content.value = res.default
  //   })
  //   return {content}
  // }
}
</script>