<demo>
常规使用
</demo>

<template>
  <div>
    <Button @click="toggle">打开对话框</Button>
    <!--  <Dialog :visible="x" @update:visible = "x = $event"></Dialog>-->
    <Dialog v-model:visible="x" :closeOnclickOverlay="false" :ok="f1" :cancel="f2">
      <!--    使用具名插槽-->
      <template v-slot:content>
        <strong>hi</strong>
        <div>hi2</div>
      </template>
      <template v-slot:title>
        <strong>加粗的标题</strong>
      </template>
    </Dialog>
  </div>
</template>

<script lang="ts">
import {Button, Dialog} from "../lib/index";
import {
  ref,
} from "vue";

export default {
  setup() {
    const x = ref(false)
    const toggle = () => {
      x.value = !x.value
    }
    const f1 = () => {
      return false
    }
    const f2 = () => {

    }
    return {f1, f2, x, toggle}
  },
  components: {
    Dialog,
    Button
  }
}
</script>
