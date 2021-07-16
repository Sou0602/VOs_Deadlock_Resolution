
# VOs_Deadlock_Resolution

## Configurations

In the addagent tuple, the terms are defined as follows - ('agent_name','initial_configuration','initial_velocity','goal_configuration','agent_vmax')

Configuration 1 (Config 1 in the paper)

    agents=[
     addAgent('1', [-8 0], [0 0], [8 0],1),
     addAgent('2', [-6 4],   [0 0], [6 -8],1),
     addAgent('3', [-6 -3],     [0 0], [8 3],1),
     addAgent('4', [0 -8],  [0 0], [0 8],1),
     addAgent('5', [-3 -6],  [0 0 ], [8 7],1), 
     addAgent('6', [4 -7],  [0 0 ], [-4 8],1), 
     addAgent('7', [3 6],  [0 0 ], [3 -6],1), 
     addAgent('8', [5 -6],  [0 0 ], [5 7],1), 
     addAgent('9', [-3 6],  [0 0 ], [-3 -6],1), 
    ];

Configuration 2

    agents=[
     addAgent('1', [-6 -2], [0 0], [4 2],1),
     addAgent('2', [-5 3],   [0 0], [4 -3],1),
     addAgent('3', [-4 -4],     [0 0], [2 4],1),
     addAgent('4', [4 0],  [0 0], [-8 0],1),
     addAgent('5', [4 -2],  [0 0], [-7 2],1), 
     addAgent('6', [2 -4],  [0 0], [-1 5],1), 
     addAgent('7', [5 2] , [0 0] , [-4 2],1),
     addAgent('8', [-2 -4],  [0 0], [-5 5],1)
    ];

Configuration 3

    agents=[
     addAgent('1', [-6 -2], [0 0], [4 2],1),
     addAgent('2', [-4 1],   [0 0], [3 -3],1),
     addAgent('3', [-4 -4],     [0 0], [2 4],1),
     addAgent('4', [2 0],  [0 0], [-8 0],1),
     addAgent('5', [2 -2],  [0 0], [-6 0],1), 
     addAgent('6', [0 -4],  [0 0], [-1 5],1), 
     addAgent('7', [-2 -4],  [0 0], [-4 5],1),
     addAgent('8', [2 -3.5],  [0 0], [-2 2.5],1),
     addAgent('9', [1.5 1.5],     [0 0], [-6 -4],1),
    ];

Configuration 4 (Config 2 in the paper)

    agents=[
     addAgent('1', [-1 -5], [0 0], [7 0],1),
     addAgent('2', [10 3],   [0 0], [-5 -3],1),
     addAgent('3', [11 -1],  [0 0], [-2 -3],1),
     addAgent('4', [3 4],  [0 0], [8 -8],1),
     addAgent('5', [3 -6],  [0 0], [3 6],1), 
     addAgent('6', [4 -5],  [0 0], [1 4],1), 
     addAgent('7', [9 0],  [0 0], [-4 2],1),
     addAgent('8', [-2 -1],  [0 0], [9 -4],1),  
    ];

Configuration 5

    agents=[
     addAgent('1', [-6 0], [0 0], [8 0],1),
     addAgent('2', [-3 3],   [0 0], [5 -6],1),
     addAgent('3', [-4 -3],     [0 0], [8 3],1),
     addAgent('4', [1 -6],  [0 0], [1 8],1),
     addAgent('5', [-3 -6],  [0 0], [7 5],1), 
     addAgent('6', [4 -7],  [0 0], [-3 5],1), 
     addAgent('7', [4 6],  [0 0], [1 -6],1), 
     addAgent('8', [6 -5],  [0 0], [-1 6],1), 
     addAgent('9', [-1 6],  [0 0], [-1 -6],1), 
    ];

Configuration 6

    agents=[
     addAgent('1', [0 -4], [0 0], [0 8],1),
     addAgent('2', [2 -3],   [0 0], [-7 7],1),
     addAgent('3', [-3 -4],     [0 0], [3 8],1),
     addAgent('4', [-6 1],  [0 0], [8 1],1),
     addAgent('5', [-6 -3],  [0 0], [5 7],1), 
     addAgent('6', [-7 4],  [0 0], [4 -1],1), 
     addAgent('7', [4 3],  [0 0], [-6 1],1), 
     addAgent('8', [-5 6],  [0 0], [6 -1],1), 
     addAgent('9', [6 1],  [0 0], [-6 -2],1), 
   ];
   
## Non-Holonomic ORCA - Deadlock Configurations

Configuration 1

![dconfig11](https://user-images.githubusercontent.com/64011517/125907362-012f8696-4f8f-401d-a98f-788035523081.gif)

Configuration 2

![dconfig10 2](https://user-images.githubusercontent.com/64011517/125907384-035e324b-d104-4b9f-86d7-9df5d10c3958.gif)

Configuration 3

![dconfig12](https://user-images.githubusercontent.com/64011517/125907405-dcacbbdf-0c46-4942-9e6e-f5e685b3fdf0.gif)

Configuration 4

![dconfig13](https://user-images.githubusercontent.com/64011517/125907438-6b4af8c3-e7e2-44ea-bf6c-6cc593f20924.gif)

Configuration 5

![dconfig12 1](https://user-images.githubusercontent.com/64011517/125907469-8a955cc1-ff36-408a-9031-4df0164a7e19.gif)

Configuration 6

![dconfig15 1](https://user-images.githubusercontent.com/64011517/125907494-de8c00c4-756b-4f9f-8e86-5d723363456a.gif)


## Weighted ORCA Allotment
Configuration 1

![config1_m1 3 (1)](https://user-images.githubusercontent.com/64011517/125901360-93c30811-f40d-4d7f-b109-e7233b60316b.gif)

Configuration 2

![config2_m1 3 (1)](https://user-images.githubusercontent.com/64011517/125902302-f343a4b6-05c4-4ce8-80cf-fbbb4580be36.gif)

Configuration 3

![config3_m1 3 (1)](https://user-images.githubusercontent.com/64011517/125902315-cf38ad0b-d5a2-42b8-ae3e-ae87e1ced29d.gif)

Configuration 4

![config4_m1 1 (1)](https://user-images.githubusercontent.com/64011517/125902321-3705aec8-eb87-46d3-b746-b5c3976c3107.gif)

Configuration 5

![config9_m1 4 (1)](https://user-images.githubusercontent.com/64011517/125902336-ed4842e4-a5a8-4c42-8c87-a3e8dad76a35.gif)

Configuration 6

![config10_m1 2 (1)](https://user-images.githubusercontent.com/64011517/125902354-a1ec3075-5fe2-4385-8b65-e09a6aa03d14.gif)

## Freespace Maximisation ORCA

Configuration 1

![config1_m2-vc](https://user-images.githubusercontent.com/64011517/125909822-885f2aa9-5769-4ef9-abde-84749966cb05.gif)

Configuration 2

![config2_m2-vc](https://user-images.githubusercontent.com/64011517/125910592-ed7e3416-4165-4c09-b81b-bc9c57ae180f.gif)

Configuration 3

Configuration 4

![config4_m3](https://user-images.githubusercontent.com/64011517/125909851-48e78944-50c1-4cb3-a1f0-949f8aca222b.gif)

Configuration 5

![config9_m3](https://user-images.githubusercontent.com/64011517/125909877-39b251de-dff3-4570-ba77-0b82e2834cd6.gif)

Configuration 6

![config10_m3](https://user-images.githubusercontent.com/64011517/125909898-7255ef96-cdfa-4fdd-8fd8-c0c77bf37c92.gif)

##Ablations

Configuration 1

![config1_sqp_nh_4s_start](https://user-images.githubusercontent.com/64011517/125911339-e1747ad7-9da7-4f5c-bc51-99a4a9dc6a0c.gif)

Configuration 2 

![config2_sqp_nh_2 5s_start](https://user-images.githubusercontent.com/64011517/125911322-39ce022d-0fc8-4005-9759-3ee1d85bda51.gif)






