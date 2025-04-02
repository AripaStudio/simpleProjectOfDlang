module RandomClass.Random;

import std.stdio;

public class Random
{

	private long a;
	private long c;
	private long m;
	private long seed;

	this(long seed , long a = 1664525, long c = 1013904223, long m = 0xFFFFFFFF)
	{
        this.seed = seed;
        this.a = a;
        this.c = c;
        this.m = m;
    }

	long next()
	{
		seed = (a * seed + c) % m;
		return seed;
	}

	long nextInRange(long min , long max)
	{
		return min + next() % (max - min);
	}
}
