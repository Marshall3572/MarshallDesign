<template>
  <button class="lunzi-switch" @click="toggle" :class="{'lunzi-checked':value}">
    <span></span>
  </button>
</template>


<script lang="ts">
import {ref} from "vue";

export default {
  props: {
    value: Boolean
  },
  setup(props, context) {
    // let checked = ref(false)
    const toggle = () => {
      // 因为我们不能再子组件中修改props，于是使用emit调用外部方法让其自己修改
      context.emit("update:value", !props.value)
      // Vue3中v-model
      // 要求：属性名任意，假设为x，则事件名必须是"update:x"
      // 效果:
      // <Switch :value="y" @update:value="y = $event" />可以简写为
      // <Switch v-model:value="y">
      // 这是Vue2到Vue3的一个重大改变


      // x = !x是错误的，ref是个盒子，盒子是不能改的，但是盒子里边的东西是可以改的
      // checked.value = !checked.value
    }
    // return {checked, toggle}
    return {toggle}
  }
}
</script>

<style lang="scss">
$h: 22px;
$h2: $h - 4px;
.lunzi-switch {
  height: $h;
  width: $h*2;
  border: none;
  background: #bfbfbf;
  border-radius: $h/2;
  position: relative;

  > span {
    position: absolute;
    top: 2px;
    left: 2px;
    height: $h2;
    width: $h2;
    background: white;
    border-radius: $h2 / 2;
    transition: all 250ms;
  }

  //当checked为ture时生效
  &.lunzi-checked {
    background: #1890ff;

    > span {
      left: calc(100% - #{$h2} - 2px)
    }
  }

  &:focus {
    outline: none;
  }

  &:active {
    > span {
      width: $h2 + 4px;
    }
  }

  &.lunzi-checked:active {
    > span {
      width: $h2 + 4px;
      margin-left: -4px;
    }
  }
}

</style>