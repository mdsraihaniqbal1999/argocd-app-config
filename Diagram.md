`````
flowchart TD
    A[User Initiates Sync<br/>UI/CLI/API] --> B{Authentication &<br/>Authorization}
    B -->|Success| C
    B -->|Failure| Z1[Access Denied]
    
    subgraph API_Server [API Server]
        C[Validate Sync Request]
        C --> D[Request Manifests from Repo Server]
    end
    
    D --> E
    
    subgraph Repo_Server [Repository Server]
        direction TB
        E{Git Repository<br/>Accessible?}
        E -->|No| Z2[Return Repo Error]
        E -->|Yes| F[Clone/Fetch from Git Repo]
        F --> G[Generate Manifests<br/>Helm, Kustomize, or YAML]
        G --> H[Store in Redis Cache]
    end
    
    H --> I[Return Cache Key to API Server]
    I --> J[API Server Instructs Application Controller]
    J --> K
    
    subgraph App_Controller [Application Controller]
        direction TB
        K[Retrieve Manifests from Cache]
        K --> L[Fetch Live State from Kubernetes]
        L --> M[Perform 3-Way Diff:<br/>Git vs Cache vs Live]
        M --> N{Resources<br/>OutOfSync?}
        N -->|No| O[Update Status: Synced]
        N -->|Yes| P{Sync Policy}
        P -->|Manual| Q[Wait for User Approval]
        P -->|Automatic| R[Apply Changes to Cluster]
        Q -->|Approved| R
        Q -->|Rejected| Z4[Sync Cancelled]
        R --> S{Apply<br/>Successful?}
        S -->|No| Z3[Mark as Sync Failed]
        S -->|Yes| T[Verify Resource Health]
        T --> U{Health Check}
        U -->|Healthy| V[Status: Synced & Healthy]
        U -->|Degraded| W[Status: Synced & Degraded]
        U -->|Progressing| X[Status: Synced & Progressing]
    end
    
    subgraph Redis_Cache [Redis Cache]
        direction TB
        Y1[Cache Compiled Manifests]
        Y2[Cache Application Status]
        Y3[Cache Resource Health Data]
    end
    
    O --> Y
    V --> Y
    W --> Y
    X --> Y
    Z3 --> Y
    Z4 --> Y
    
    Y[Update Application CR Status] --> Z[Push Status to API Server]
    
    subgraph UI_Update [Real-time Updates]
        Z --> AA[Update Web UI]
        Z --> AB[CLI Status Response]
        Z --> AC[API Response]
        AA --> AD[User Sees Live Status]
        AB --> AD
        AC --> AD
    end
    
    %% Continuous Monitoring Loops
    V -.-> AE{Auto-Sync<br/>Enabled?}
    W -.-> AE
    X -.-> AE
    AE -.->|Yes| AF[Monitor Git for Changes]
    AF -.-> D
    
    V -.-> AG[Periodic Health Check]
    W -.-> AG
    X -.-> AG
    AG -.-> T
    
    %% Redis interactions
    H -.-> Y1
    Y -.-> Y2
    T -.-> Y3
    
    %% Error flows
    Z1 --> Z5[Return Error to User]
    Z2 --> Z5
    Z3 --> Z5
    Z4 --> Z5
    
    %% Webhook trigger path
    AH[Git Webhook] -.-> D
    
    %% Component Styling
    style API_Server fill:#bbdefb,stroke:#1e88e5,stroke-width:2px
    style Repo_Server fill:#d1c4e9,stroke:#673ab7,stroke-width:2px
    style App_Controller fill:#c8e6c9,stroke:#388e3c,stroke-width:2px
    style Redis_Cache fill:#ffcdd2,stroke:#e57373,stroke-width:2px
    style UI_Update fill:#fff3e0,stroke:#ff9800,stroke-width:2px
    
    %% Status Styling
    style V fill:#c8e6c9,stroke:#4caf50,stroke-width:3px
    style W fill:#fff3e0,stroke:#ff9800,stroke-width:3px
    style X fill:#e1f5fe,stroke:#03a9f4,stroke-width:3px
    style Z1 fill:#ffebee,stroke:#f44336,stroke-width:3px
    style Z2 fill:#ffebee,stroke:#f44336,stroke-width:3px
    style Z3 fill:#ffebee,stroke:#f44336,stroke-width:3px
    style Z4 fill:#ffebee,stroke:#f44336,stroke-width:3px
    style Z5 fill:#ffebee,stroke:#f44336,stroke-width:3px
    
    %% Decision nodes
    style B fill:#f3e5f5,stroke:#9c27b0,stroke-width:2px
    style E fill:#f3e5f5,stroke:#9c27b0,stroke-width:2px
    style N fill:#f3e5f5,stroke:#9c27b0,stroke-width:2px
    style P fill:#f3e5f5,stroke:#9c27b0,stroke-width:2px
    style S fill:#f3e5f5,stroke:#9c27b0,stroke-width:2px
    style U fill:#f3e5f5,stroke:#9c27b0,stroke-width:2px
    style AE fill:#f3e5f5,stroke:#9c27b0,stroke-width:2px

`````
