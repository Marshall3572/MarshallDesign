// 告诉TS理解.vue文件
declare module '*.vue' {
    import { ComponentOptions } from 'vue'
    const componentOptions: ComponentOptions
    export default componentOptions
}
// 告诉TS理解.md文件
declare module '*.md' {
    const str: string
    export default str
}