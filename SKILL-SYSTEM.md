# SKILL-SYSTEM.md

当前已装核心 skills 的职责、调用优先级与典型工作流。

## 一、核心分层

### 1. 方法与判断层

#### qiushi-skill
- 作用：先看事实，再下判断；能验证就不靠猜。
- 使用场景：信息不足、需要分析、需要做选择、需要复盘时。
- 定位：总原则层，默认贯穿全部任务。

#### skill-vetter
- 作用：审查新 skill 是否值得安装、是否有坑、是否适合当前体系。
- 使用场景：接收新 skill 链接、准备安装前、判断 skill 价值时。
- 定位：新 skill 入口守门员。

#### xiucheng-self-improving-agent
- 作用：任务/写作/策略完成后复盘，提炼有效模式与错误模式。
- 使用场景：阶段结束、产出完成、出现重复错误后。
- 定位：阶段复盘与长期成长层。

### 2. 主动推进与任务层

#### proactive-tasks
- 作用：长期目标管理、任务拆解、heartbeat 主动推进、阻塞记录、上下文压缩恢复。
- 使用场景：长期项目、多轮任务、需要持续推进的工作。
- 定位：长期任务推进器。

#### multi-search-engine
- 作用：外部资料调研、题材考据、平台风格研究、竞品观察。
- 使用场景：资料不足、需要外部输入、写作/研究前置调查。
- 定位：外部输入增强层。

### 3. 写作核心层

#### writers-room-story-engine
- 作用：诊断故事当前阶段，决定先做 foundation / worldbuilding / scene / revision。
- 使用场景：从零起书、故事空心、结构不稳、场景没功能、结尾无力。
- 定位：故事学总控与诊断器。

#### open-novel-writing
- 作用：中文长篇小说创作主流程：设定、大纲、章节 spec、正文、评审。
- 使用场景：正式进入中文网文创作流程、章节规划、正文生成、质量评审。
- 定位：中文网文章节生产主控器。

#### novel-writing
- 作用：长篇项目骨架：设定、章节、追踪器、伏笔/冲突/反馈管理。
- 使用场景：准备长期写一本书、需要长期项目化管理。
- 定位：长篇网文工程骨架。

#### novel-writer-structure
- 作用：时间线、人物状态、连续性、伏笔回收、章节防崩。
- 使用场景：已有设定/大纲后的精细写作、中长篇持续推进。
- 定位：长篇连载防崩器。

## 二、调用优先级

### 默认总控
1. qiushi-skill

### 新 skill 相关
1. qiushi-skill
2. skill-vetter
3. （如需资料）multi-search-engine
4. 安装后纳入现有体系
5. xiucheng-self-improving-agent（复盘）

### 长任务 / 长项目
1. qiushi-skill
2. proactive-tasks
3. （如需外部信息）multi-search-engine
4. xiucheng-self-improving-agent

### 从零起一本书
1. qiushi-skill
2. writers-room-story-engine
3. open-novel-writing
4. novel-writing
5. novel-writer-structure
6. multi-search-engine
7. xiucheng-self-improving-agent

### 直接写某一章
1. qiushi-skill
2. open-novel-writing
3. novel-writer-structure
4. novel-writing
5. xiucheng-self-improving-agent

## 三、典型工作流

### 工作流 A：新 skill 安装与筛选
1. 收到 skill 链接
2. 用 qiushi-skill 按事实和边界判断
3. 用 skill-vetter 做筛查
4. 决定是否安装
5. 安装后总结职责与位置
6. 阶段结束后复盘

### 工作流 B：长期项目推进
1. 明确长期目标
2. 用 proactive-tasks 建 goal / task
3. heartbeat 时推进可推进项
4. 卡住时记录阻塞与待决事项
5. 需要资料时调 multi-search-engine
6. 阶段完成后复盘

### 工作流 C：从零起书
1. 用 writers-room-story-engine 诊断故事阶段
2. 用 open-novel-writing 搭设定、大纲与章节 spec
3. 用 novel-writing 建立项目骨架与追踪器
4. 用 novel-writer-structure 做章节连续性与防崩控制
5. 用 multi-search-engine 做资料补强
6. 每阶段用 xiucheng-self-improving-agent 复盘

## 四、当前体系一句话总结

- qiushi-skill：做事底盘
- skill-vetter：新 skill 守门
- proactive-tasks：长期推进
- multi-search-engine：外部调研
- writers-room-story-engine：故事诊断
- open-novel-writing：中文写作主流程
- novel-writing：长篇工程骨架
- novel-writer-structure：长篇防崩
- xiucheng-self-improving-agent：阶段复盘
