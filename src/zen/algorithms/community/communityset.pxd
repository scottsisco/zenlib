from zen.graph cimport Graph

cimport numpy as np
from cpython cimport bool

cdef class Community:
	cdef Graph _graph
	cdef set _nodes
	cdef readonly int community_idx

	cpdef bool has_node_index(Community self, int nidx)

cdef class CommunitySet:
	cdef Graph _graph
	cdef int _num_communities
	cdef object _communities

	cdef void __raise_if_invalid_nidx(CommunitySet self, int nidx) except *
	cdef Community __build_community(CommunitySet self, int cidx)
	cdef list __build_all_communities(CommunitySet self)
	cpdef Community community_(CommunitySet self, int nidx)
	cpdef int community_idx_(CommunitySet self, int nidx) except -1
	cpdef bool share_community_(CommunitySet self, int u_idx, int v_idx)

