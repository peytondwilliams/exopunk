using Godot;
using System;
using System.Collections.Generic;

public partial class PriQueue : Node
{
	private PriorityQueue<string, int> pq;
	
	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		pq = new PriorityQueue<string, int>();
	}

	public void Enqueue(string str, int cost) {
		pq.Enqueue(str, cost);
	}
	
	public string Dequeue() {
		if (pq.Count == 0) {
			return "empty";
		}
		return pq.Dequeue();
	}

	public void Clear() {
		pq.Clear();
	}
	
	public int Size() {
		return pq.Count;
	}
}
