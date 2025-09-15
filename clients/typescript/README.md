# OzwellAI TypeScript/JavaScript Client

Official TypeScript/JavaScript client library for the OzwellAI API.

## Installation

### npm

```bash
npm install ozwellai
```

### JSR (for Deno)

```bash
deno add @mieweb/ozwellai
```

## Usage

### Basic Setup

```typescript
// ES Modules
import OzwellAI from "ozwellai";

// Or in CommonJS:
// const OzwellAI = require("ozwellai");

const client = new OzwellAI({
  apiKey: process.env.OZWELLAI_API_KEY, // best practice: load from env
});
```

### Configuration Options

```typescript
const client = new OzwellAI({
  apiKey: 'your-api-key',
  baseURL: 'https://api.ozwell.ai', // optional, defaults to official API
  timeout: 30000, // optional, defaults to 30 seconds
  defaultHeaders: { // optional
    'X-Custom-Header': 'value'
  }
});
```

### Ollama Integration

For local development or testing with Ollama, use the special `ollama` API key to automatically connect to your local Ollama instance:

```typescript
const ollamaClient = new OzwellAI({
  apiKey: 'ollama' // Automatically connects to http://localhost:11434
});

// Use any model you have installed in Ollama
const response = await ollamaClient.createChatCompletion({
  model: 'llama2', // or any model installed in your Ollama
  messages: [
    { role: 'user', content: 'Hello from Ollama!' }
  ]
});
```

The client will automatically use `http://localhost:11434` as the base URL when the API key is set to `"ollama"` (case-insensitive). You can still override the `baseURL` if your Ollama instance is running on a different host or port.

**Prerequisites for Ollama:**
1. Install Ollama from [https://ollama.ai](https://ollama.ai) 
2. Pull at least one model: `ollama pull llama2`
3. Ensure Ollama is running: `ollama serve` (usually starts automatically)

See [`examples/ollama-example.ts`](./examples/ollama-example.ts) for a complete working example.

### Chat Completions

```typescript
const response = await client.createChatCompletion({
  model: 'gpt-4',
  messages: [
    { role: 'user', content: 'Hello, how are you?' }
  ],
  temperature: 0.7,
});

console.log(response.choices[0].message.content);
```

### Embeddings

```typescript
const response = await client.createEmbedding({
  model: 'text-embedding-ada-002',
  input: 'The food was delicious and the waiter...',
});

console.log(response.data[0].embedding);
```

### File Operations

```typescript
// Upload a file
const file = new File(['content'], 'example.txt', { type: 'text/plain' });
const uploadedFile = await client.uploadFile(file, 'assistants');

// List files
const files = await client.listFiles();

// Get file details
const fileDetails = await client.getFile('file-abc123');

// Delete file
await client.deleteFile('file-abc123');
```

### Models

```typescript
// List available models
const models = await client.listModels();
console.log(models.data);
```

### Ozwell-Specific Features

```typescript
// Use the custom responses endpoint
const response = await client.createResponse({
  model: 'ozwell-v1',
  input: 'Analyze this data...',
  temperature: 0.5,
});
```

## TypeScript Support

This package is written in TypeScript and includes full type definitions. All API request and response types are exported:

```typescript
import type {
  ChatCompletionRequest,
  ChatCompletionResponse,
  EmbeddingRequest,
  EmbeddingResponse,
} from 'ozwellai';
```

## Node.js and Deno Support

This package supports both Node.js (18+) and Deno environments:

- **Node.js**: Uses built-in `fetch` (Node 18+) or polyfill
- **Deno**: Native fetch and Web APIs support
- **Browser**: Full browser compatibility with bundlers

## Error Handling

```typescript
try {
  const response = await client.createChatCompletion({
    model: 'gpt-4',
    messages: [{ role: 'user', content: 'Hello!' }],
  });
} catch (error) {
  console.error('API Error:', error.message);
}
```

## Contributing

This client is part of the [ozwellai-api](https://github.com/mieweb/ozwellai-api) repository. Please see the main repository for contributing guidelines.

## License

Apache 2.0 - see the [LICENSE](../../LICENSE) file for details.
