// Code generated by entc, DO NOT EDIT.

package ent

import (
	"context"
	"errors"
	"fmt"
	"math"

	"entgo.io/ent/dialect/sql"
	"entgo.io/ent/dialect/sql/sqlgraph"
	"entgo.io/ent/schema/field"
	"github.com/google/uuid"
	"github.com/sentrionic/horizon/ent/playlist"
	"github.com/sentrionic/horizon/ent/playlistsong"
	"github.com/sentrionic/horizon/ent/predicate"
	"github.com/sentrionic/horizon/ent/song"
)

// PlaylistSongQuery is the builder for querying PlaylistSong entities.
type PlaylistSongQuery struct {
	config
	limit      *int
	offset     *int
	unique     *bool
	order      []OrderFunc
	fields     []string
	predicates []predicate.PlaylistSong
	// eager-loading edges.
	withPlaylist *PlaylistQuery
	withSong     *SongQuery
	// intermediate query (i.e. traversal path).
	sql  *sql.Selector
	path func(context.Context) (*sql.Selector, error)
}

// Where adds a new predicate for the PlaylistSongQuery builder.
func (psq *PlaylistSongQuery) Where(ps ...predicate.PlaylistSong) *PlaylistSongQuery {
	psq.predicates = append(psq.predicates, ps...)
	return psq
}

// Limit adds a limit step to the query.
func (psq *PlaylistSongQuery) Limit(limit int) *PlaylistSongQuery {
	psq.limit = &limit
	return psq
}

// Offset adds an offset step to the query.
func (psq *PlaylistSongQuery) Offset(offset int) *PlaylistSongQuery {
	psq.offset = &offset
	return psq
}

// Unique configures the query builder to filter duplicate records on query.
// By default, unique is set to true, and can be disabled using this method.
func (psq *PlaylistSongQuery) Unique(unique bool) *PlaylistSongQuery {
	psq.unique = &unique
	return psq
}

// Order adds an order step to the query.
func (psq *PlaylistSongQuery) Order(o ...OrderFunc) *PlaylistSongQuery {
	psq.order = append(psq.order, o...)
	return psq
}

// QueryPlaylist chains the current query on the "playlist" edge.
func (psq *PlaylistSongQuery) QueryPlaylist() *PlaylistQuery {
	query := &PlaylistQuery{config: psq.config}
	query.path = func(ctx context.Context) (fromU *sql.Selector, err error) {
		if err := psq.prepareQuery(ctx); err != nil {
			return nil, err
		}
		selector := psq.sqlQuery(ctx)
		if err := selector.Err(); err != nil {
			return nil, err
		}
		step := sqlgraph.NewStep(
			sqlgraph.From(playlistsong.Table, playlistsong.FieldID, selector),
			sqlgraph.To(playlist.Table, playlist.FieldID),
			sqlgraph.Edge(sqlgraph.M2O, true, playlistsong.PlaylistTable, playlistsong.PlaylistColumn),
		)
		fromU = sqlgraph.SetNeighbors(psq.driver.Dialect(), step)
		return fromU, nil
	}
	return query
}

// QuerySong chains the current query on the "song" edge.
func (psq *PlaylistSongQuery) QuerySong() *SongQuery {
	query := &SongQuery{config: psq.config}
	query.path = func(ctx context.Context) (fromU *sql.Selector, err error) {
		if err := psq.prepareQuery(ctx); err != nil {
			return nil, err
		}
		selector := psq.sqlQuery(ctx)
		if err := selector.Err(); err != nil {
			return nil, err
		}
		step := sqlgraph.NewStep(
			sqlgraph.From(playlistsong.Table, playlistsong.FieldID, selector),
			sqlgraph.To(song.Table, song.FieldID),
			sqlgraph.Edge(sqlgraph.M2O, true, playlistsong.SongTable, playlistsong.SongColumn),
		)
		fromU = sqlgraph.SetNeighbors(psq.driver.Dialect(), step)
		return fromU, nil
	}
	return query
}

// First returns the first PlaylistSong entity from the query.
// Returns a *NotFoundError when no PlaylistSong was found.
func (psq *PlaylistSongQuery) First(ctx context.Context) (*PlaylistSong, error) {
	nodes, err := psq.Limit(1).All(ctx)
	if err != nil {
		return nil, err
	}
	if len(nodes) == 0 {
		return nil, &NotFoundError{playlistsong.Label}
	}
	return nodes[0], nil
}

// FirstX is like First, but panics if an error occurs.
func (psq *PlaylistSongQuery) FirstX(ctx context.Context) *PlaylistSong {
	node, err := psq.First(ctx)
	if err != nil && !IsNotFound(err) {
		panic(err)
	}
	return node
}

// FirstID returns the first PlaylistSong ID from the query.
// Returns a *NotFoundError when no PlaylistSong ID was found.
func (psq *PlaylistSongQuery) FirstID(ctx context.Context) (id int, err error) {
	var ids []int
	if ids, err = psq.Limit(1).IDs(ctx); err != nil {
		return
	}
	if len(ids) == 0 {
		err = &NotFoundError{playlistsong.Label}
		return
	}
	return ids[0], nil
}

// FirstIDX is like FirstID, but panics if an error occurs.
func (psq *PlaylistSongQuery) FirstIDX(ctx context.Context) int {
	id, err := psq.FirstID(ctx)
	if err != nil && !IsNotFound(err) {
		panic(err)
	}
	return id
}

// Only returns a single PlaylistSong entity found by the query, ensuring it only returns one.
// Returns a *NotSingularError when more than one PlaylistSong entity is found.
// Returns a *NotFoundError when no PlaylistSong entities are found.
func (psq *PlaylistSongQuery) Only(ctx context.Context) (*PlaylistSong, error) {
	nodes, err := psq.Limit(2).All(ctx)
	if err != nil {
		return nil, err
	}
	switch len(nodes) {
	case 1:
		return nodes[0], nil
	case 0:
		return nil, &NotFoundError{playlistsong.Label}
	default:
		return nil, &NotSingularError{playlistsong.Label}
	}
}

// OnlyX is like Only, but panics if an error occurs.
func (psq *PlaylistSongQuery) OnlyX(ctx context.Context) *PlaylistSong {
	node, err := psq.Only(ctx)
	if err != nil {
		panic(err)
	}
	return node
}

// OnlyID is like Only, but returns the only PlaylistSong ID in the query.
// Returns a *NotSingularError when more than one PlaylistSong ID is found.
// Returns a *NotFoundError when no entities are found.
func (psq *PlaylistSongQuery) OnlyID(ctx context.Context) (id int, err error) {
	var ids []int
	if ids, err = psq.Limit(2).IDs(ctx); err != nil {
		return
	}
	switch len(ids) {
	case 1:
		id = ids[0]
	case 0:
		err = &NotFoundError{playlistsong.Label}
	default:
		err = &NotSingularError{playlistsong.Label}
	}
	return
}

// OnlyIDX is like OnlyID, but panics if an error occurs.
func (psq *PlaylistSongQuery) OnlyIDX(ctx context.Context) int {
	id, err := psq.OnlyID(ctx)
	if err != nil {
		panic(err)
	}
	return id
}

// All executes the query and returns a list of PlaylistSongs.
func (psq *PlaylistSongQuery) All(ctx context.Context) ([]*PlaylistSong, error) {
	if err := psq.prepareQuery(ctx); err != nil {
		return nil, err
	}
	return psq.sqlAll(ctx)
}

// AllX is like All, but panics if an error occurs.
func (psq *PlaylistSongQuery) AllX(ctx context.Context) []*PlaylistSong {
	nodes, err := psq.All(ctx)
	if err != nil {
		panic(err)
	}
	return nodes
}

// IDs executes the query and returns a list of PlaylistSong IDs.
func (psq *PlaylistSongQuery) IDs(ctx context.Context) ([]int, error) {
	var ids []int
	if err := psq.Select(playlistsong.FieldID).Scan(ctx, &ids); err != nil {
		return nil, err
	}
	return ids, nil
}

// IDsX is like IDs, but panics if an error occurs.
func (psq *PlaylistSongQuery) IDsX(ctx context.Context) []int {
	ids, err := psq.IDs(ctx)
	if err != nil {
		panic(err)
	}
	return ids
}

// Count returns the count of the given query.
func (psq *PlaylistSongQuery) Count(ctx context.Context) (int, error) {
	if err := psq.prepareQuery(ctx); err != nil {
		return 0, err
	}
	return psq.sqlCount(ctx)
}

// CountX is like Count, but panics if an error occurs.
func (psq *PlaylistSongQuery) CountX(ctx context.Context) int {
	count, err := psq.Count(ctx)
	if err != nil {
		panic(err)
	}
	return count
}

// Exist returns true if the query has elements in the graph.
func (psq *PlaylistSongQuery) Exist(ctx context.Context) (bool, error) {
	if err := psq.prepareQuery(ctx); err != nil {
		return false, err
	}
	return psq.sqlExist(ctx)
}

// ExistX is like Exist, but panics if an error occurs.
func (psq *PlaylistSongQuery) ExistX(ctx context.Context) bool {
	exist, err := psq.Exist(ctx)
	if err != nil {
		panic(err)
	}
	return exist
}

// Clone returns a duplicate of the PlaylistSongQuery builder, including all associated steps. It can be
// used to prepare common query builders and use them differently after the clone is made.
func (psq *PlaylistSongQuery) Clone() *PlaylistSongQuery {
	if psq == nil {
		return nil
	}
	return &PlaylistSongQuery{
		config:       psq.config,
		limit:        psq.limit,
		offset:       psq.offset,
		order:        append([]OrderFunc{}, psq.order...),
		predicates:   append([]predicate.PlaylistSong{}, psq.predicates...),
		withPlaylist: psq.withPlaylist.Clone(),
		withSong:     psq.withSong.Clone(),
		// clone intermediate query.
		sql:    psq.sql.Clone(),
		path:   psq.path,
		unique: psq.unique,
	}
}

// WithPlaylist tells the query-builder to eager-load the nodes that are connected to
// the "playlist" edge. The optional arguments are used to configure the query builder of the edge.
func (psq *PlaylistSongQuery) WithPlaylist(opts ...func(*PlaylistQuery)) *PlaylistSongQuery {
	query := &PlaylistQuery{config: psq.config}
	for _, opt := range opts {
		opt(query)
	}
	psq.withPlaylist = query
	return psq
}

// WithSong tells the query-builder to eager-load the nodes that are connected to
// the "song" edge. The optional arguments are used to configure the query builder of the edge.
func (psq *PlaylistSongQuery) WithSong(opts ...func(*SongQuery)) *PlaylistSongQuery {
	query := &SongQuery{config: psq.config}
	for _, opt := range opts {
		opt(query)
	}
	psq.withSong = query
	return psq
}

// GroupBy is used to group vertices by one or more fields/columns.
// It is often used with aggregate functions, like: count, max, mean, min, sum.
//
// Example:
//
//	var v []struct {
//		PlaylistID uuid.UUID `json:"playlist_id,omitempty"`
//		Count int `json:"count,omitempty"`
//	}
//
//	client.PlaylistSong.Query().
//		GroupBy(playlistsong.FieldPlaylistID).
//		Aggregate(ent.Count()).
//		Scan(ctx, &v)
//
func (psq *PlaylistSongQuery) GroupBy(field string, fields ...string) *PlaylistSongGroupBy {
	group := &PlaylistSongGroupBy{config: psq.config}
	group.fields = append([]string{field}, fields...)
	group.path = func(ctx context.Context) (prev *sql.Selector, err error) {
		if err := psq.prepareQuery(ctx); err != nil {
			return nil, err
		}
		return psq.sqlQuery(ctx), nil
	}
	return group
}

// Select allows the selection one or more fields/columns for the given query,
// instead of selecting all fields in the entity.
//
// Example:
//
//	var v []struct {
//		PlaylistID uuid.UUID `json:"playlist_id,omitempty"`
//	}
//
//	client.PlaylistSong.Query().
//		Select(playlistsong.FieldPlaylistID).
//		Scan(ctx, &v)
//
func (psq *PlaylistSongQuery) Select(fields ...string) *PlaylistSongSelect {
	psq.fields = append(psq.fields, fields...)
	return &PlaylistSongSelect{PlaylistSongQuery: psq}
}

func (psq *PlaylistSongQuery) prepareQuery(ctx context.Context) error {
	for _, f := range psq.fields {
		if !playlistsong.ValidColumn(f) {
			return &ValidationError{Name: f, err: fmt.Errorf("ent: invalid field %q for query", f)}
		}
	}
	if psq.path != nil {
		prev, err := psq.path(ctx)
		if err != nil {
			return err
		}
		psq.sql = prev
	}
	return nil
}

func (psq *PlaylistSongQuery) sqlAll(ctx context.Context) ([]*PlaylistSong, error) {
	var (
		nodes       = []*PlaylistSong{}
		_spec       = psq.querySpec()
		loadedTypes = [2]bool{
			psq.withPlaylist != nil,
			psq.withSong != nil,
		}
	)
	_spec.ScanValues = func(columns []string) ([]interface{}, error) {
		node := &PlaylistSong{config: psq.config}
		nodes = append(nodes, node)
		return node.scanValues(columns)
	}
	_spec.Assign = func(columns []string, values []interface{}) error {
		if len(nodes) == 0 {
			return fmt.Errorf("ent: Assign called without calling ScanValues")
		}
		node := nodes[len(nodes)-1]
		node.Edges.loadedTypes = loadedTypes
		return node.assignValues(columns, values)
	}
	if err := sqlgraph.QueryNodes(ctx, psq.driver, _spec); err != nil {
		return nil, err
	}
	if len(nodes) == 0 {
		return nodes, nil
	}

	if query := psq.withPlaylist; query != nil {
		ids := make([]uuid.UUID, 0, len(nodes))
		nodeids := make(map[uuid.UUID][]*PlaylistSong)
		for i := range nodes {
			fk := nodes[i].PlaylistID
			if _, ok := nodeids[fk]; !ok {
				ids = append(ids, fk)
			}
			nodeids[fk] = append(nodeids[fk], nodes[i])
		}
		query.Where(playlist.IDIn(ids...))
		neighbors, err := query.All(ctx)
		if err != nil {
			return nil, err
		}
		for _, n := range neighbors {
			nodes, ok := nodeids[n.ID]
			if !ok {
				return nil, fmt.Errorf(`unexpected foreign-key "playlist_id" returned %v`, n.ID)
			}
			for i := range nodes {
				nodes[i].Edges.Playlist = n
			}
		}
	}

	if query := psq.withSong; query != nil {
		ids := make([]uuid.UUID, 0, len(nodes))
		nodeids := make(map[uuid.UUID][]*PlaylistSong)
		for i := range nodes {
			fk := nodes[i].SongID
			if _, ok := nodeids[fk]; !ok {
				ids = append(ids, fk)
			}
			nodeids[fk] = append(nodeids[fk], nodes[i])
		}
		query.Where(song.IDIn(ids...))
		neighbors, err := query.All(ctx)
		if err != nil {
			return nil, err
		}
		for _, n := range neighbors {
			nodes, ok := nodeids[n.ID]
			if !ok {
				return nil, fmt.Errorf(`unexpected foreign-key "song_id" returned %v`, n.ID)
			}
			for i := range nodes {
				nodes[i].Edges.Song = n
			}
		}
	}

	return nodes, nil
}

func (psq *PlaylistSongQuery) sqlCount(ctx context.Context) (int, error) {
	_spec := psq.querySpec()
	_spec.Node.Columns = psq.fields
	if len(psq.fields) > 0 {
		_spec.Unique = psq.unique != nil && *psq.unique
	}
	return sqlgraph.CountNodes(ctx, psq.driver, _spec)
}

func (psq *PlaylistSongQuery) sqlExist(ctx context.Context) (bool, error) {
	n, err := psq.sqlCount(ctx)
	if err != nil {
		return false, fmt.Errorf("ent: check existence: %w", err)
	}
	return n > 0, nil
}

func (psq *PlaylistSongQuery) querySpec() *sqlgraph.QuerySpec {
	_spec := &sqlgraph.QuerySpec{
		Node: &sqlgraph.NodeSpec{
			Table:   playlistsong.Table,
			Columns: playlistsong.Columns,
			ID: &sqlgraph.FieldSpec{
				Type:   field.TypeInt,
				Column: playlistsong.FieldID,
			},
		},
		From:   psq.sql,
		Unique: true,
	}
	if unique := psq.unique; unique != nil {
		_spec.Unique = *unique
	}
	if fields := psq.fields; len(fields) > 0 {
		_spec.Node.Columns = make([]string, 0, len(fields))
		_spec.Node.Columns = append(_spec.Node.Columns, playlistsong.FieldID)
		for i := range fields {
			if fields[i] != playlistsong.FieldID {
				_spec.Node.Columns = append(_spec.Node.Columns, fields[i])
			}
		}
	}
	if ps := psq.predicates; len(ps) > 0 {
		_spec.Predicate = func(selector *sql.Selector) {
			for i := range ps {
				ps[i](selector)
			}
		}
	}
	if limit := psq.limit; limit != nil {
		_spec.Limit = *limit
	}
	if offset := psq.offset; offset != nil {
		_spec.Offset = *offset
	}
	if ps := psq.order; len(ps) > 0 {
		_spec.Order = func(selector *sql.Selector) {
			for i := range ps {
				ps[i](selector)
			}
		}
	}
	return _spec
}

func (psq *PlaylistSongQuery) sqlQuery(ctx context.Context) *sql.Selector {
	builder := sql.Dialect(psq.driver.Dialect())
	t1 := builder.Table(playlistsong.Table)
	columns := psq.fields
	if len(columns) == 0 {
		columns = playlistsong.Columns
	}
	selector := builder.Select(t1.Columns(columns...)...).From(t1)
	if psq.sql != nil {
		selector = psq.sql
		selector.Select(selector.Columns(columns...)...)
	}
	if psq.unique != nil && *psq.unique {
		selector.Distinct()
	}
	for _, p := range psq.predicates {
		p(selector)
	}
	for _, p := range psq.order {
		p(selector)
	}
	if offset := psq.offset; offset != nil {
		// limit is mandatory for offset clause. We start
		// with default value, and override it below if needed.
		selector.Offset(*offset).Limit(math.MaxInt32)
	}
	if limit := psq.limit; limit != nil {
		selector.Limit(*limit)
	}
	return selector
}

// PlaylistSongGroupBy is the group-by builder for PlaylistSong entities.
type PlaylistSongGroupBy struct {
	config
	fields []string
	fns    []AggregateFunc
	// intermediate query (i.e. traversal path).
	sql  *sql.Selector
	path func(context.Context) (*sql.Selector, error)
}

// Aggregate adds the given aggregation functions to the group-by query.
func (psgb *PlaylistSongGroupBy) Aggregate(fns ...AggregateFunc) *PlaylistSongGroupBy {
	psgb.fns = append(psgb.fns, fns...)
	return psgb
}

// Scan applies the group-by query and scans the result into the given value.
func (psgb *PlaylistSongGroupBy) Scan(ctx context.Context, v interface{}) error {
	query, err := psgb.path(ctx)
	if err != nil {
		return err
	}
	psgb.sql = query
	return psgb.sqlScan(ctx, v)
}

// ScanX is like Scan, but panics if an error occurs.
func (psgb *PlaylistSongGroupBy) ScanX(ctx context.Context, v interface{}) {
	if err := psgb.Scan(ctx, v); err != nil {
		panic(err)
	}
}

// Strings returns list of strings from group-by.
// It is only allowed when executing a group-by query with one field.
func (psgb *PlaylistSongGroupBy) Strings(ctx context.Context) ([]string, error) {
	if len(psgb.fields) > 1 {
		return nil, errors.New("ent: PlaylistSongGroupBy.Strings is not achievable when grouping more than 1 field")
	}
	var v []string
	if err := psgb.Scan(ctx, &v); err != nil {
		return nil, err
	}
	return v, nil
}

// StringsX is like Strings, but panics if an error occurs.
func (psgb *PlaylistSongGroupBy) StringsX(ctx context.Context) []string {
	v, err := psgb.Strings(ctx)
	if err != nil {
		panic(err)
	}
	return v
}

// String returns a single string from a group-by query.
// It is only allowed when executing a group-by query with one field.
func (psgb *PlaylistSongGroupBy) String(ctx context.Context) (_ string, err error) {
	var v []string
	if v, err = psgb.Strings(ctx); err != nil {
		return
	}
	switch len(v) {
	case 1:
		return v[0], nil
	case 0:
		err = &NotFoundError{playlistsong.Label}
	default:
		err = fmt.Errorf("ent: PlaylistSongGroupBy.Strings returned %d results when one was expected", len(v))
	}
	return
}

// StringX is like String, but panics if an error occurs.
func (psgb *PlaylistSongGroupBy) StringX(ctx context.Context) string {
	v, err := psgb.String(ctx)
	if err != nil {
		panic(err)
	}
	return v
}

// Ints returns list of ints from group-by.
// It is only allowed when executing a group-by query with one field.
func (psgb *PlaylistSongGroupBy) Ints(ctx context.Context) ([]int, error) {
	if len(psgb.fields) > 1 {
		return nil, errors.New("ent: PlaylistSongGroupBy.Ints is not achievable when grouping more than 1 field")
	}
	var v []int
	if err := psgb.Scan(ctx, &v); err != nil {
		return nil, err
	}
	return v, nil
}

// IntsX is like Ints, but panics if an error occurs.
func (psgb *PlaylistSongGroupBy) IntsX(ctx context.Context) []int {
	v, err := psgb.Ints(ctx)
	if err != nil {
		panic(err)
	}
	return v
}

// Int returns a single int from a group-by query.
// It is only allowed when executing a group-by query with one field.
func (psgb *PlaylistSongGroupBy) Int(ctx context.Context) (_ int, err error) {
	var v []int
	if v, err = psgb.Ints(ctx); err != nil {
		return
	}
	switch len(v) {
	case 1:
		return v[0], nil
	case 0:
		err = &NotFoundError{playlistsong.Label}
	default:
		err = fmt.Errorf("ent: PlaylistSongGroupBy.Ints returned %d results when one was expected", len(v))
	}
	return
}

// IntX is like Int, but panics if an error occurs.
func (psgb *PlaylistSongGroupBy) IntX(ctx context.Context) int {
	v, err := psgb.Int(ctx)
	if err != nil {
		panic(err)
	}
	return v
}

// Float64s returns list of float64s from group-by.
// It is only allowed when executing a group-by query with one field.
func (psgb *PlaylistSongGroupBy) Float64s(ctx context.Context) ([]float64, error) {
	if len(psgb.fields) > 1 {
		return nil, errors.New("ent: PlaylistSongGroupBy.Float64s is not achievable when grouping more than 1 field")
	}
	var v []float64
	if err := psgb.Scan(ctx, &v); err != nil {
		return nil, err
	}
	return v, nil
}

// Float64sX is like Float64s, but panics if an error occurs.
func (psgb *PlaylistSongGroupBy) Float64sX(ctx context.Context) []float64 {
	v, err := psgb.Float64s(ctx)
	if err != nil {
		panic(err)
	}
	return v
}

// Float64 returns a single float64 from a group-by query.
// It is only allowed when executing a group-by query with one field.
func (psgb *PlaylistSongGroupBy) Float64(ctx context.Context) (_ float64, err error) {
	var v []float64
	if v, err = psgb.Float64s(ctx); err != nil {
		return
	}
	switch len(v) {
	case 1:
		return v[0], nil
	case 0:
		err = &NotFoundError{playlistsong.Label}
	default:
		err = fmt.Errorf("ent: PlaylistSongGroupBy.Float64s returned %d results when one was expected", len(v))
	}
	return
}

// Float64X is like Float64, but panics if an error occurs.
func (psgb *PlaylistSongGroupBy) Float64X(ctx context.Context) float64 {
	v, err := psgb.Float64(ctx)
	if err != nil {
		panic(err)
	}
	return v
}

// Bools returns list of bools from group-by.
// It is only allowed when executing a group-by query with one field.
func (psgb *PlaylistSongGroupBy) Bools(ctx context.Context) ([]bool, error) {
	if len(psgb.fields) > 1 {
		return nil, errors.New("ent: PlaylistSongGroupBy.Bools is not achievable when grouping more than 1 field")
	}
	var v []bool
	if err := psgb.Scan(ctx, &v); err != nil {
		return nil, err
	}
	return v, nil
}

// BoolsX is like Bools, but panics if an error occurs.
func (psgb *PlaylistSongGroupBy) BoolsX(ctx context.Context) []bool {
	v, err := psgb.Bools(ctx)
	if err != nil {
		panic(err)
	}
	return v
}

// Bool returns a single bool from a group-by query.
// It is only allowed when executing a group-by query with one field.
func (psgb *PlaylistSongGroupBy) Bool(ctx context.Context) (_ bool, err error) {
	var v []bool
	if v, err = psgb.Bools(ctx); err != nil {
		return
	}
	switch len(v) {
	case 1:
		return v[0], nil
	case 0:
		err = &NotFoundError{playlistsong.Label}
	default:
		err = fmt.Errorf("ent: PlaylistSongGroupBy.Bools returned %d results when one was expected", len(v))
	}
	return
}

// BoolX is like Bool, but panics if an error occurs.
func (psgb *PlaylistSongGroupBy) BoolX(ctx context.Context) bool {
	v, err := psgb.Bool(ctx)
	if err != nil {
		panic(err)
	}
	return v
}

func (psgb *PlaylistSongGroupBy) sqlScan(ctx context.Context, v interface{}) error {
	for _, f := range psgb.fields {
		if !playlistsong.ValidColumn(f) {
			return &ValidationError{Name: f, err: fmt.Errorf("invalid field %q for group-by", f)}
		}
	}
	selector := psgb.sqlQuery()
	if err := selector.Err(); err != nil {
		return err
	}
	rows := &sql.Rows{}
	query, args := selector.Query()
	if err := psgb.driver.Query(ctx, query, args, rows); err != nil {
		return err
	}
	defer rows.Close()
	return sql.ScanSlice(rows, v)
}

func (psgb *PlaylistSongGroupBy) sqlQuery() *sql.Selector {
	selector := psgb.sql.Select()
	aggregation := make([]string, 0, len(psgb.fns))
	for _, fn := range psgb.fns {
		aggregation = append(aggregation, fn(selector))
	}
	// If no columns were selected in a custom aggregation function, the default
	// selection is the fields used for "group-by", and the aggregation functions.
	if len(selector.SelectedColumns()) == 0 {
		columns := make([]string, 0, len(psgb.fields)+len(psgb.fns))
		for _, f := range psgb.fields {
			columns = append(columns, selector.C(f))
		}
		columns = append(columns, aggregation...)
		selector.Select(columns...)
	}
	return selector.GroupBy(selector.Columns(psgb.fields...)...)
}

// PlaylistSongSelect is the builder for selecting fields of PlaylistSong entities.
type PlaylistSongSelect struct {
	*PlaylistSongQuery
	// intermediate query (i.e. traversal path).
	sql *sql.Selector
}

// Scan applies the selector query and scans the result into the given value.
func (pss *PlaylistSongSelect) Scan(ctx context.Context, v interface{}) error {
	if err := pss.prepareQuery(ctx); err != nil {
		return err
	}
	pss.sql = pss.PlaylistSongQuery.sqlQuery(ctx)
	return pss.sqlScan(ctx, v)
}

// ScanX is like Scan, but panics if an error occurs.
func (pss *PlaylistSongSelect) ScanX(ctx context.Context, v interface{}) {
	if err := pss.Scan(ctx, v); err != nil {
		panic(err)
	}
}

// Strings returns list of strings from a selector. It is only allowed when selecting one field.
func (pss *PlaylistSongSelect) Strings(ctx context.Context) ([]string, error) {
	if len(pss.fields) > 1 {
		return nil, errors.New("ent: PlaylistSongSelect.Strings is not achievable when selecting more than 1 field")
	}
	var v []string
	if err := pss.Scan(ctx, &v); err != nil {
		return nil, err
	}
	return v, nil
}

// StringsX is like Strings, but panics if an error occurs.
func (pss *PlaylistSongSelect) StringsX(ctx context.Context) []string {
	v, err := pss.Strings(ctx)
	if err != nil {
		panic(err)
	}
	return v
}

// String returns a single string from a selector. It is only allowed when selecting one field.
func (pss *PlaylistSongSelect) String(ctx context.Context) (_ string, err error) {
	var v []string
	if v, err = pss.Strings(ctx); err != nil {
		return
	}
	switch len(v) {
	case 1:
		return v[0], nil
	case 0:
		err = &NotFoundError{playlistsong.Label}
	default:
		err = fmt.Errorf("ent: PlaylistSongSelect.Strings returned %d results when one was expected", len(v))
	}
	return
}

// StringX is like String, but panics if an error occurs.
func (pss *PlaylistSongSelect) StringX(ctx context.Context) string {
	v, err := pss.String(ctx)
	if err != nil {
		panic(err)
	}
	return v
}

// Ints returns list of ints from a selector. It is only allowed when selecting one field.
func (pss *PlaylistSongSelect) Ints(ctx context.Context) ([]int, error) {
	if len(pss.fields) > 1 {
		return nil, errors.New("ent: PlaylistSongSelect.Ints is not achievable when selecting more than 1 field")
	}
	var v []int
	if err := pss.Scan(ctx, &v); err != nil {
		return nil, err
	}
	return v, nil
}

// IntsX is like Ints, but panics if an error occurs.
func (pss *PlaylistSongSelect) IntsX(ctx context.Context) []int {
	v, err := pss.Ints(ctx)
	if err != nil {
		panic(err)
	}
	return v
}

// Int returns a single int from a selector. It is only allowed when selecting one field.
func (pss *PlaylistSongSelect) Int(ctx context.Context) (_ int, err error) {
	var v []int
	if v, err = pss.Ints(ctx); err != nil {
		return
	}
	switch len(v) {
	case 1:
		return v[0], nil
	case 0:
		err = &NotFoundError{playlistsong.Label}
	default:
		err = fmt.Errorf("ent: PlaylistSongSelect.Ints returned %d results when one was expected", len(v))
	}
	return
}

// IntX is like Int, but panics if an error occurs.
func (pss *PlaylistSongSelect) IntX(ctx context.Context) int {
	v, err := pss.Int(ctx)
	if err != nil {
		panic(err)
	}
	return v
}

// Float64s returns list of float64s from a selector. It is only allowed when selecting one field.
func (pss *PlaylistSongSelect) Float64s(ctx context.Context) ([]float64, error) {
	if len(pss.fields) > 1 {
		return nil, errors.New("ent: PlaylistSongSelect.Float64s is not achievable when selecting more than 1 field")
	}
	var v []float64
	if err := pss.Scan(ctx, &v); err != nil {
		return nil, err
	}
	return v, nil
}

// Float64sX is like Float64s, but panics if an error occurs.
func (pss *PlaylistSongSelect) Float64sX(ctx context.Context) []float64 {
	v, err := pss.Float64s(ctx)
	if err != nil {
		panic(err)
	}
	return v
}

// Float64 returns a single float64 from a selector. It is only allowed when selecting one field.
func (pss *PlaylistSongSelect) Float64(ctx context.Context) (_ float64, err error) {
	var v []float64
	if v, err = pss.Float64s(ctx); err != nil {
		return
	}
	switch len(v) {
	case 1:
		return v[0], nil
	case 0:
		err = &NotFoundError{playlistsong.Label}
	default:
		err = fmt.Errorf("ent: PlaylistSongSelect.Float64s returned %d results when one was expected", len(v))
	}
	return
}

// Float64X is like Float64, but panics if an error occurs.
func (pss *PlaylistSongSelect) Float64X(ctx context.Context) float64 {
	v, err := pss.Float64(ctx)
	if err != nil {
		panic(err)
	}
	return v
}

// Bools returns list of bools from a selector. It is only allowed when selecting one field.
func (pss *PlaylistSongSelect) Bools(ctx context.Context) ([]bool, error) {
	if len(pss.fields) > 1 {
		return nil, errors.New("ent: PlaylistSongSelect.Bools is not achievable when selecting more than 1 field")
	}
	var v []bool
	if err := pss.Scan(ctx, &v); err != nil {
		return nil, err
	}
	return v, nil
}

// BoolsX is like Bools, but panics if an error occurs.
func (pss *PlaylistSongSelect) BoolsX(ctx context.Context) []bool {
	v, err := pss.Bools(ctx)
	if err != nil {
		panic(err)
	}
	return v
}

// Bool returns a single bool from a selector. It is only allowed when selecting one field.
func (pss *PlaylistSongSelect) Bool(ctx context.Context) (_ bool, err error) {
	var v []bool
	if v, err = pss.Bools(ctx); err != nil {
		return
	}
	switch len(v) {
	case 1:
		return v[0], nil
	case 0:
		err = &NotFoundError{playlistsong.Label}
	default:
		err = fmt.Errorf("ent: PlaylistSongSelect.Bools returned %d results when one was expected", len(v))
	}
	return
}

// BoolX is like Bool, but panics if an error occurs.
func (pss *PlaylistSongSelect) BoolX(ctx context.Context) bool {
	v, err := pss.Bool(ctx)
	if err != nil {
		panic(err)
	}
	return v
}

func (pss *PlaylistSongSelect) sqlScan(ctx context.Context, v interface{}) error {
	rows := &sql.Rows{}
	query, args := pss.sql.Query()
	if err := pss.driver.Query(ctx, query, args, rows); err != nil {
		return err
	}
	defer rows.Close()
	return sql.ScanSlice(rows, v)
}
