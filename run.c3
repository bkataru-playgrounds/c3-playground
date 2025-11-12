module qwen3c3;
import std::io;
import std::core::mem;

struct Config
{
	int dim; 
	int hidden_dim; 
	int n_layers;
	int n_heads;  
	int n_kv_heads;
	int vocab_size; 
	int seq_len; 
	int head_dim; 
}

struct TransformerWeights
{
	
	float[] token_embedding_table; 
	
	float[] rms_att_weight;
	float[] rms_ffn_weight;

	float[] wq;
	float[] wk;
	float[] wv;
	float[] wo;
	float[] wq_norm;
	float[] wk_norm;
	float[] w1;
	float[] w2;
	float[] w3;
	float[] rms_final_weight;
	float[] wcls;
}

struct RunState
{
	float[] x;
	float[] xb;
	float[] xb2;
	float[] xb3;
	float[] hb;
	float[] hb2;
	float[] q;
	float[] k;
	float[] v;
	float[] att;
	float[] logits;
	float[] key_cache;
	float[] value_cache;
}

struct Transformer
{
	Config config;
	TransformerWeights weights;
	RunState state;
	int fd;
	float[] data;
	isz file_size;
}

fn RunState* RunState.malloc(Config* p) {
	int att_head_dim = p.n_heads * p.head_dim;
	int kv_dim = p.n_kv_heads * p.head_dim;

	RunState s = {
		.x = mem::new_array(float, p.dim),
		.xb = mem::new_array(float, p.dim),
		.xb2 = mem::new_array(float, p.dim),
		.xb3 = mem::new_array(float, att_head_dim),
		.hb = mem::new_array(float, p.hidden_dim),
		.hb2 = mem::new_array(float, p.hidden_dim),
		.q = mem::new_array(float, att_head_dim),
		.k = mem::new_array(float, kv_dim),
		.v = mem::new_array(float, kv_dim),
		.att = mem::new_array(float, p.n_heads * p.seq_len),
		.logits = mem::new_array(float, p.vocab_size),
		
 	};

	return &s;
}

fn void main()
{
	
}
