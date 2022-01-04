<template>
  <button class="lunzi-button" :class="classes" :disabled="disabled">
    <span v-if="loading" class="lunzi-loadingIndicator"></span>
    <slot/>
  </button>
</template>

<script lang="ts">
import {computed} from "vue";

export default {
  props: {
    theme: {
      type: String,
      default: 'button'
    },
    size: {
      type: String,
      default: 'normal'
    },
    level: {
      type: String,
      default: "normal"
    },
    disabled: {
      default: false
    },
  },
  setup(props) {
    const {theme, size, level} = props
    const classes = computed(() => {
      return {
        [`lunzi-theme-${theme}`]: theme,
        [`lunzi-size-${size}`]: size,
        [`lunzi-level-${level}`]: level,
      }
    })
    return {classes}
  }
  // 当给组件传递事件时，默认不继承
  // inheritAttrs: false
}
</script>

<style lang="scss">
$h: 32px;
$border-color: #d9d9d9;
$color: #333;
$blue: #40a9ff;
$radius: 4px;
.lunzi-button {
  box-sizing: border-box;
  height: $h;
  padding: 0 12px;
  $red: red;
  $grey: grey;
  cursor: pointer;
  display: inline-flex;
  justify-content: center;
  align-items: center;
  white-space: nowrap;
  background: white;
  color: $color;
  border: 1px solid $border-color;
  border-radius: $radius;
  box-shadow: 0 1px 0 fade-out(black, 0.95);
  transition: background 250ms;

  & + & {
    margin-left: 8px;
  }

  &:hover,
  &:focus {
    color: $blue;
    border-color: $blue;
  }

  &:focus {
    outline: none;
  }

  // 火狐浏览器不支持上边这个设置，故特殊处理
  &::-moz-focus-inner {
    border: 0;
  }

  &.lunzi-theme-link {
    border-color: transparent;
    box-shadow: none;
    color: $blue;

    &:hover, &:focus {
      color: lighten($blue, 10%);
    }
  }

  &.lunzi-theme-text {
    border-color: transparent;
    box-shadow: none;
    color: inherit;

    &:hover, &:focus {
      background: darken(white, 5%);;
    }
  }

  &.lunzi-size-big {
    font-size: 24px;
    height: 48px;
    padding: 0 16px
  }

  &.lunzi-size-small {
    font-size: 12px;
    height: 20px;
    padding: 0 4px;
  }

  &.lunzi-theme-button {
    &.lunzi-level-main {
      background: $blue;
      color: white;
      border-color: $blue;

      &:hover,
      &:focus {
        background: darken($blue, 10%);
        border-color: darken($blue, 10%);
      }
    }

    &.lunzi-level-danger {
      background: $red;
      border-color: $red;
      color: white;

      &:hover,
      &:focus {
        background: darken($red, 10%);
        border-color: darken($red, 10%);
      }
    }
  }

  &.lunzi-theme-link {
    &.lunzi-level-danger {
      color: $red;

      &:hover,
      &:focus {
        color: darken($red, 10%);
      }
    }
  }

  &.lunzi-theme-text {
    &.lunzi-level-main {
      color: $blue;

      &:hover,
      &:focus {
        color: darken($blue, 10%);
      }
    }

    &.lunzi-level-danger {
      color: $red;

      &:hover,
      &:focus {
        color: darken($red, 10%);
      }
    }
  }

  &.lunzi-theme-button {
    &[disabled] {
      cursor: not-allowed;
      color: $grey;

      &:hover {
        border-color: $grey;
      }
    }
  }

  &.lunzi-theme-link, &.lunzi-theme-text {
    &[disabled] {
      cursor: not-allowed;
      color: $grey;
    }
  }
  > .lunzi-loadingIndicator{
    width: 14px;
    height: 14px;
    display: inline-block;
    margin-right: 4px;
    border-radius: 8px;
    border-color: $blue $blue $blue transparent;
    border-style: solid;
    border-width: 2px;
    animation: lunzi-spin 1s infinite linear;
  }
  @keyframes lunzi-spin {
    0%{transform: rotate(0deg)}
    100%{transform: rotate(360deg)}
  }
}
</style>