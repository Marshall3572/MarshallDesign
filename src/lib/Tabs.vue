<template>
  <div class="lunzi-tabs">
    <div class="lunzi-tabs-nav" ref="container">
      <div class="lunzi-tabs-nav-item" v-for="(t,index) in titles" @click="select(t)"
           :class="{selected: t === selected}" :key="index"
           :ref="el => { if (t === selected) selectedItem = el }">
        {{ t }}
      </div>
      <div class="lunzi-tabs-nav-indicator" ref="indicator"></div>
    </div>
    <div class="lunzi-tabs-content">
      <!--      {{ current }}}-->
      <component class="lunzi-tabs-content-item" :is="current" :key="selected"/>
      <!--      v-for="(c,index) in defaults" v-if="c.props.title === selected" :key="index"-->
    </div>
  </div>
</template>

<script lang="ts">
import Tab from "./Tab.vue"
import {computed, ref, onMounted, onUpdated} from "vue";

export default {
  props: {
    selected: {
      type: String
    },
  },
  setup(props, context) {
    const selectedItem = ref<HTMLDivElement>(null)
    const indicator = ref<HTMLDivElement>(null)
    const container = ref<HTMLDivElement>(null)
    const x = () => {
      const {width} = selectedItem.value.getBoundingClientRect()
      indicator.value.style.width = width + 'px'
      const {left: left1} = container.value.getBoundingClientRect()
      const {left: left2} = selectedItem.value.getBoundingClientRect()
      const left = left2 - left1
      indicator.value.style.left = left + 'px'
    }
    onMounted(x)
    onUpdated(x)

    const defaults = context.slots.default()
    defaults.forEach((tag) => {
      // @ts-ignore
      if (tag.type.name !== Tab.name) {
        throw new Error('Tabs 子标签必须是 Tab')
      }
    })
    const current = computed(() => {
      return defaults.filter((tag) => {
        return tag.props.title === props.selected
      })[0]
    })
    const titles = defaults.map((tag) => {
      return tag.props.title
    })
    const select = (title: string) => {
      context.emit('update:selected', title)
    }
    return {defaults, titles, select, current, selectedItem, indicator, container}
  }
}
</script>

<style lang="scss">
$blue: #40a9ff;
$color: #333;
$border-color: #d9d9d9;

.lunzi-tabs {
  &-nav {
    display: flex;
    color: $color;
    border-bottom: 1px solid $border-color;
    position: relative;

    &-item {
      padding: 8px 0;
      margin: 0 16px;
      cursor: pointer;

      &:first-child {
        margin-left: 0;
      }

      &.selected {
        color: $blue;
      }
    }

    &-indicator {
      position: absolute;
      width: 100px;
      height: 3px;
      background: $blue;
      left: 0;
      bottom: -1px;
      transition: all 250ms;
    }
  }

  &-content {
    padding: 8px 0;
  }
}
</style>