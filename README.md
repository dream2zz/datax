# datax

```
docker run -d --name mysql \
-p 3306:3306 \
-e MYSQL_HOST=% \
-e MYSQL_ROOT_PASSWORD=p@ssw0rd \
mysql:5.7
```

```
docker run --rm \
--link mysql:mysql \
-v ./job/demo.json:/demo.json \
ghcr.io/dream2zz/datax:main \
python3 ./bin/datax.py /demo.json
```

---

**output**
```
DataX (DATAX-OPENSOURCE-3.0), From Alibaba !
Copyright (C) 2010-2017, Alibaba Group. All Rights Reserved.


2024-01-04 14:32:31.315 [main] INFO  MessageSource - JVM TimeZone: GMT+08:00, Locale: zh_CN
2024-01-04 14:32:31.317 [main] INFO  MessageSource - use Locale: zh_CN timeZone: sun.util.calendar.ZoneInfo[id="GMT+08:00",offset=28800000,dstSavings=0,useDaylight=false,transitions=0,lastRule=null]
2024-01-04 14:32:31.354 [main] INFO  VMInfo - VMInfo# operatingSystem class => com.sun.management.internal.OperatingSystemImpl
2024-01-04 14:32:31.363 [main] INFO  Engine - the machine info  => 

        osInfo: Linux amd64 5.15.133.1-microsoft-standard-WSL2
        jvmInfo:        Private Build 17 17.0.7+7-Ubuntu-0ubuntu118.04
        cpu num:        8

        totalPhysicalMemory:    -0.00G
        freePhysicalMemory:     -0.00G
        maxFileDescriptorCount: -1
        currentOpenFileDescriptorCount: -1

        GC Names        [G1 Young Generation, G1 Old Generation]

        MEMORY_NAME                    | allocation_size                | init_size                      
        CodeHeap 'profiled nmethods'   | 117.21MB                       | 2.44MB                         
        G1 Old Gen                     | 1,024.00MB                     | 970.00MB                       
        G1 Survivor Space              | -0.00MB                        | 0.00MB                         
        CodeHeap 'non-profiled nmethods' | 117.21MB                       | 2.44MB                         
        Compressed Class Space         | 1,024.00MB                     | 0.00MB                         
        Metaspace                      | -0.00MB                        | 0.00MB                         
        G1 Eden Space                  | -0.00MB                        | 54.00MB                        
        CodeHeap 'non-nmethods'        | 5.57MB                         | 2.44MB                         


2024-01-04 14:32:31.377 [main] INFO  Engine - 
{
        "setting":{
                "speed":{
                        "channel":1
                },
                "errorLimit":{
                        "record":0,
                        "percentage":0
                }
        },
        "content":[
                {
                        "reader":{
                                "name":"mysqlreader",
                                "parameter":{
                                        "username":"root",
                                        "password":"********",
                                        "column":[
                                                "id",
                                                "ship_name"
                                        ],
                                        "connection":[
                                                {
                                                        "table":[
                                                                "orders"
                                                        ],
                                                        "jdbcUrl":[
                                                                "jdbc:mysql://localhost:3306/northwind?useSSL=false"
                                                        ]
                                                }
                                        ]
                                }
                        },
                        "writer":{
                                "name":"mysqlwriter",
                                "parameter":{
                                        "username":"root",
                                        "password":"********",
                                        "column":[
                                                "id",
                                                "name"
                                        ],
                                        "connection":[
                                                {
                                                        "jdbcUrl":"jdbc:mysql://localhost:3306/northwind?useSSL=false",
                                                        "table":[
                                                                "NewTable1"
                                                        ]
                                                }
                                        ]
                                }
                        }
                }
        ]
}

2024-01-04 14:32:31.402 [main] INFO  PerfTrace - PerfTrace traceId=job_-1, isEnable=false
2024-01-04 14:32:31.402 [main] INFO  JobContainer - DataX jobContainer starts job.
2024-01-04 14:32:31.403 [main] INFO  JobContainer - Set jobId = 0
2024-01-04 14:32:31.649 [job-0] INFO  OriginalConfPretreatmentUtil - Available jdbcUrl:jdbc:mysql://localhost:3306/northwind?useSSL=false&yearIsDateType=false&zeroDateTimeBehavior=convertToNull&tinyInt1isBit=false&rewriteBatchedStatements=true.
2024-01-04 14:32:31.660 [job-0] INFO  OriginalConfPretreatmentUtil - table:[orders] has columns:[id,employee_id,customer_id,order_date,shipped_date,shipper_id,ship_name,ship_address,ship_city,ship_state_province,ship_zip_postal_code,ship_country_region,shipping_fee,taxes,payment_type,paid_date,notes,tax_rate,tax_status_id,status_id].
2024-01-04 14:32:31.891 [job-0] INFO  OriginalConfPretreatmentUtil - table:[NewTable1] all columns:[
id,name
].
2024-01-04 14:32:31.898 [job-0] INFO  OriginalConfPretreatmentUtil - Write data [
INSERT INTO %s (id,name) VALUES(?,?)
], which jdbcUrl like:[jdbc:mysql://localhost:3306/northwind?useSSL=false&yearIsDateType=false&zeroDateTimeBehavior=convertToNull&rewriteBatchedStatements=true&tinyInt1isBit=false]
2024-01-04 14:32:31.899 [job-0] INFO  JobContainer - jobContainer starts to do prepare ...
2024-01-04 14:32:31.899 [job-0] INFO  JobContainer - DataX Reader.Job [mysqlreader] do prepare work .
2024-01-04 14:32:31.899 [job-0] INFO  JobContainer - DataX Writer.Job [mysqlwriter] do prepare work .
2024-01-04 14:32:31.899 [job-0] INFO  JobContainer - jobContainer starts to do split ...
2024-01-04 14:32:31.900 [job-0] INFO  JobContainer - Job set Channel-Number to 1 channels.
2024-01-04 14:32:31.902 [job-0] INFO  JobContainer - DataX Reader.Job [mysqlreader] splits to [1] tasks.
2024-01-04 14:32:31.903 [job-0] INFO  JobContainer - DataX Writer.Job [mysqlwriter] splits to [1] tasks.
2024-01-04 14:32:31.923 [job-0] INFO  JobContainer - jobContainer starts to do schedule ...
2024-01-04 14:32:31.929 [job-0] INFO  JobContainer - Scheduler starts [1] taskGroups.
2024-01-04 14:32:31.931 [job-0] INFO  JobContainer - Running by standalone Mode.
2024-01-04 14:32:31.935 [taskGroup-0] INFO  TaskGroupContainer - taskGroupId=[0] start [1] channels for [1] tasks.
2024-01-04 14:32:31.938 [taskGroup-0] INFO  Channel - Channel set byte_speed_limit to -1, No bps activated.
2024-01-04 14:32:31.938 [taskGroup-0] INFO  Channel - Channel set record_speed_limit to -1, No tps activated.
2024-01-04 14:32:31.948 [taskGroup-0] INFO  TaskGroupContainer - taskGroup[0] taskId[0] attemptCount[1] is started
2024-01-04 14:32:31.950 [0-0-0-reader] INFO  CommonRdbmsReader$Task - Begin to read record by Sql: [select id,ship_name from orders 
] jdbcUrl:[jdbc:mysql://localhost:3306/northwind?useSSL=false&yearIsDateType=false&zeroDateTimeBehavior=convertToNull&tinyInt1isBit=false&rewriteBatchedStatements=true].
2024-01-04 14:32:31.971 [0-0-0-reader] INFO  CommonRdbmsReader$Task - Finished read record by Sql: [select id,ship_name from orders 
] jdbcUrl:[jdbc:mysql://localhost:3306/northwind?useSSL=false&yearIsDateType=false&zeroDateTimeBehavior=convertToNull&tinyInt1isBit=false&rewriteBatchedStatements=true].
2024-01-04 14:32:32.250 [taskGroup-0] INFO  TaskGroupContainer - taskGroup[0] taskId[0] is successed, used[302]ms
2024-01-04 14:32:32.250 [taskGroup-0] INFO  TaskGroupContainer - taskGroup[0] completed it's tasks.
2024-01-04 14:32:41.943 [job-0] INFO  StandAloneJobContainerCommunicator - Total 48 records, 778 bytes | Speed 77B/s, 4 records/s | Error 0 records, 0 bytes |  All Task WaitWriterTime 0.000s |  All Task WaitReaderTime 0.005s | Percentage 100.00%
2024-01-04 14:32:41.944 [job-0] INFO  AbstractScheduler - Scheduler accomplished all tasks.
2024-01-04 14:32:41.945 [job-0] INFO  JobContainer - DataX Writer.Job [mysqlwriter] do post work.
2024-01-04 14:32:41.945 [job-0] INFO  JobContainer - DataX Reader.Job [mysqlreader] do post work.
2024-01-04 14:32:41.945 [job-0] INFO  JobContainer - DataX jobId [0] completed successfully.
2024-01-04 14:32:41.946 [job-0] INFO  HookInvoker - No hook invoked, because base dir not exists or is a file: /root/datax/hook
2024-01-04 14:32:41.948 [job-0] INFO  JobContainer - 
         [total cpu info] => 
                averageCpu                     | maxDeltaCpu                    | minDeltaCpu                    
                -1.00%                         | -1.00%                         | -1.00%
                        

         [total gc info] => 
                 NAME                 | totalGCCount       | maxDeltaGCCount    | minDeltaGCCount    | totalGCTime        | maxDeltaGCTime     | minDeltaGCTime     
                 G1 Young Generation  | 0                  | 0                  | 0                  | 0.000s             | 0.000s             | 0.000s             
                 G1 Old Generation    | 0                  | 0                  | 0                  | 0.000s             | 0.000s             | 0.000s             

2024-01-04 14:32:41.948 [job-0] INFO  JobContainer - PerfTrace not enable!
2024-01-04 14:32:41.948 [job-0] INFO  StandAloneJobContainerCommunicator - Total 48 records, 778 bytes | Speed 77B/s, 4 records/s | Error 0 records, 0 bytes |  All Task WaitWriterTime 0.000s |  All Task WaitReaderTime 0.005s | Percentage 100.00%
2024-01-04 14:32:41.949 [job-0] INFO  JobContainer - 
任务启动时刻                    : 2024-01-04 14:32:31
任务结束时刻                    : 2024-01-04 14:32:41
任务总计耗时                    :                 10s
任务平均流量                    :               77B/s
记录写入速度                    :              4rec/s
读出记录总数                    :                  48
读写失败总数                    :                   0
```