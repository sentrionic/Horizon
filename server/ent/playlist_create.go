// Code generated by ent, DO NOT EDIT.

package ent

import (
	"context"
	"errors"
	"fmt"
	"time"

	"entgo.io/ent/dialect/sql/sqlgraph"
	"entgo.io/ent/schema/field"
	"github.com/google/uuid"
	"github.com/sentrionic/horizon/ent/playlist"
	"github.com/sentrionic/horizon/ent/playlistsong"
	"github.com/sentrionic/horizon/ent/user"
)

// PlaylistCreate is the builder for creating a Playlist entity.
type PlaylistCreate struct {
	config
	mutation *PlaylistMutation
	hooks    []Hook
}

// SetCreatedAt sets the "created_at" field.
func (pc *PlaylistCreate) SetCreatedAt(t time.Time) *PlaylistCreate {
	pc.mutation.SetCreatedAt(t)
	return pc
}

// SetNillableCreatedAt sets the "created_at" field if the given value is not nil.
func (pc *PlaylistCreate) SetNillableCreatedAt(t *time.Time) *PlaylistCreate {
	if t != nil {
		pc.SetCreatedAt(*t)
	}
	return pc
}

// SetUpdatedAt sets the "updated_at" field.
func (pc *PlaylistCreate) SetUpdatedAt(t time.Time) *PlaylistCreate {
	pc.mutation.SetUpdatedAt(t)
	return pc
}

// SetNillableUpdatedAt sets the "updated_at" field if the given value is not nil.
func (pc *PlaylistCreate) SetNillableUpdatedAt(t *time.Time) *PlaylistCreate {
	if t != nil {
		pc.SetUpdatedAt(*t)
	}
	return pc
}

// SetUserID sets the "user_id" field.
func (pc *PlaylistCreate) SetUserID(u uuid.UUID) *PlaylistCreate {
	pc.mutation.SetUserID(u)
	return pc
}

// SetName sets the "name" field.
func (pc *PlaylistCreate) SetName(s string) *PlaylistCreate {
	pc.mutation.SetName(s)
	return pc
}

// SetDescription sets the "description" field.
func (pc *PlaylistCreate) SetDescription(s string) *PlaylistCreate {
	pc.mutation.SetDescription(s)
	return pc
}

// SetNillableDescription sets the "description" field if the given value is not nil.
func (pc *PlaylistCreate) SetNillableDescription(s *string) *PlaylistCreate {
	if s != nil {
		pc.SetDescription(*s)
	}
	return pc
}

// SetID sets the "id" field.
func (pc *PlaylistCreate) SetID(u uuid.UUID) *PlaylistCreate {
	pc.mutation.SetID(u)
	return pc
}

// SetNillableID sets the "id" field if the given value is not nil.
func (pc *PlaylistCreate) SetNillableID(u *uuid.UUID) *PlaylistCreate {
	if u != nil {
		pc.SetID(*u)
	}
	return pc
}

// SetUser sets the "user" edge to the User entity.
func (pc *PlaylistCreate) SetUser(u *User) *PlaylistCreate {
	return pc.SetUserID(u.ID)
}

// AddSongIDs adds the "songs" edge to the PlaylistSong entity by IDs.
func (pc *PlaylistCreate) AddSongIDs(ids ...int) *PlaylistCreate {
	pc.mutation.AddSongIDs(ids...)
	return pc
}

// AddSongs adds the "songs" edges to the PlaylistSong entity.
func (pc *PlaylistCreate) AddSongs(p ...*PlaylistSong) *PlaylistCreate {
	ids := make([]int, len(p))
	for i := range p {
		ids[i] = p[i].ID
	}
	return pc.AddSongIDs(ids...)
}

// Mutation returns the PlaylistMutation object of the builder.
func (pc *PlaylistCreate) Mutation() *PlaylistMutation {
	return pc.mutation
}

// Save creates the Playlist in the database.
func (pc *PlaylistCreate) Save(ctx context.Context) (*Playlist, error) {
	var (
		err  error
		node *Playlist
	)
	pc.defaults()
	if len(pc.hooks) == 0 {
		if err = pc.check(); err != nil {
			return nil, err
		}
		node, err = pc.sqlSave(ctx)
	} else {
		var mut Mutator = MutateFunc(func(ctx context.Context, m Mutation) (Value, error) {
			mutation, ok := m.(*PlaylistMutation)
			if !ok {
				return nil, fmt.Errorf("unexpected mutation type %T", m)
			}
			if err = pc.check(); err != nil {
				return nil, err
			}
			pc.mutation = mutation
			if node, err = pc.sqlSave(ctx); err != nil {
				return nil, err
			}
			mutation.id = &node.ID
			mutation.done = true
			return node, err
		})
		for i := len(pc.hooks) - 1; i >= 0; i-- {
			if pc.hooks[i] == nil {
				return nil, fmt.Errorf("ent: uninitialized hook (forgotten import ent/runtime?)")
			}
			mut = pc.hooks[i](mut)
		}
		v, err := mut.Mutate(ctx, pc.mutation)
		if err != nil {
			return nil, err
		}
		nv, ok := v.(*Playlist)
		if !ok {
			return nil, fmt.Errorf("unexpected node type %T returned from PlaylistMutation", v)
		}
		node = nv
	}
	return node, err
}

// SaveX calls Save and panics if Save returns an error.
func (pc *PlaylistCreate) SaveX(ctx context.Context) *Playlist {
	v, err := pc.Save(ctx)
	if err != nil {
		panic(err)
	}
	return v
}

// Exec executes the query.
func (pc *PlaylistCreate) Exec(ctx context.Context) error {
	_, err := pc.Save(ctx)
	return err
}

// ExecX is like Exec, but panics if an error occurs.
func (pc *PlaylistCreate) ExecX(ctx context.Context) {
	if err := pc.Exec(ctx); err != nil {
		panic(err)
	}
}

// defaults sets the default values of the builder before save.
func (pc *PlaylistCreate) defaults() {
	if _, ok := pc.mutation.CreatedAt(); !ok {
		v := playlist.DefaultCreatedAt()
		pc.mutation.SetCreatedAt(v)
	}
	if _, ok := pc.mutation.UpdatedAt(); !ok {
		v := playlist.DefaultUpdatedAt()
		pc.mutation.SetUpdatedAt(v)
	}
	if _, ok := pc.mutation.ID(); !ok {
		v := playlist.DefaultID()
		pc.mutation.SetID(v)
	}
}

// check runs all checks and user-defined validators on the builder.
func (pc *PlaylistCreate) check() error {
	if _, ok := pc.mutation.CreatedAt(); !ok {
		return &ValidationError{Name: "created_at", err: errors.New(`ent: missing required field "Playlist.created_at"`)}
	}
	if _, ok := pc.mutation.UpdatedAt(); !ok {
		return &ValidationError{Name: "updated_at", err: errors.New(`ent: missing required field "Playlist.updated_at"`)}
	}
	if _, ok := pc.mutation.UserID(); !ok {
		return &ValidationError{Name: "user_id", err: errors.New(`ent: missing required field "Playlist.user_id"`)}
	}
	if _, ok := pc.mutation.Name(); !ok {
		return &ValidationError{Name: "name", err: errors.New(`ent: missing required field "Playlist.name"`)}
	}
	if v, ok := pc.mutation.Name(); ok {
		if err := playlist.NameValidator(v); err != nil {
			return &ValidationError{Name: "name", err: fmt.Errorf(`ent: validator failed for field "Playlist.name": %w`, err)}
		}
	}
	if _, ok := pc.mutation.UserID(); !ok {
		return &ValidationError{Name: "user", err: errors.New(`ent: missing required edge "Playlist.user"`)}
	}
	return nil
}

func (pc *PlaylistCreate) sqlSave(ctx context.Context) (*Playlist, error) {
	_node, _spec := pc.createSpec()
	if err := sqlgraph.CreateNode(ctx, pc.driver, _spec); err != nil {
		if sqlgraph.IsConstraintError(err) {
			err = &ConstraintError{msg: err.Error(), wrap: err}
		}
		return nil, err
	}
	if _spec.ID.Value != nil {
		if id, ok := _spec.ID.Value.(*uuid.UUID); ok {
			_node.ID = *id
		} else if err := _node.ID.Scan(_spec.ID.Value); err != nil {
			return nil, err
		}
	}
	return _node, nil
}

func (pc *PlaylistCreate) createSpec() (*Playlist, *sqlgraph.CreateSpec) {
	var (
		_node = &Playlist{config: pc.config}
		_spec = &sqlgraph.CreateSpec{
			Table: playlist.Table,
			ID: &sqlgraph.FieldSpec{
				Type:   field.TypeUUID,
				Column: playlist.FieldID,
			},
		}
	)
	if id, ok := pc.mutation.ID(); ok {
		_node.ID = id
		_spec.ID.Value = &id
	}
	if value, ok := pc.mutation.CreatedAt(); ok {
		_spec.Fields = append(_spec.Fields, &sqlgraph.FieldSpec{
			Type:   field.TypeTime,
			Value:  value,
			Column: playlist.FieldCreatedAt,
		})
		_node.CreatedAt = value
	}
	if value, ok := pc.mutation.UpdatedAt(); ok {
		_spec.Fields = append(_spec.Fields, &sqlgraph.FieldSpec{
			Type:   field.TypeTime,
			Value:  value,
			Column: playlist.FieldUpdatedAt,
		})
		_node.UpdatedAt = value
	}
	if value, ok := pc.mutation.Name(); ok {
		_spec.Fields = append(_spec.Fields, &sqlgraph.FieldSpec{
			Type:   field.TypeString,
			Value:  value,
			Column: playlist.FieldName,
		})
		_node.Name = value
	}
	if value, ok := pc.mutation.Description(); ok {
		_spec.Fields = append(_spec.Fields, &sqlgraph.FieldSpec{
			Type:   field.TypeString,
			Value:  value,
			Column: playlist.FieldDescription,
		})
		_node.Description = &value
	}
	if nodes := pc.mutation.UserIDs(); len(nodes) > 0 {
		edge := &sqlgraph.EdgeSpec{
			Rel:     sqlgraph.M2O,
			Inverse: true,
			Table:   playlist.UserTable,
			Columns: []string{playlist.UserColumn},
			Bidi:    false,
			Target: &sqlgraph.EdgeTarget{
				IDSpec: &sqlgraph.FieldSpec{
					Type:   field.TypeUUID,
					Column: user.FieldID,
				},
			},
		}
		for _, k := range nodes {
			edge.Target.Nodes = append(edge.Target.Nodes, k)
		}
		_node.UserID = nodes[0]
		_spec.Edges = append(_spec.Edges, edge)
	}
	if nodes := pc.mutation.SongsIDs(); len(nodes) > 0 {
		edge := &sqlgraph.EdgeSpec{
			Rel:     sqlgraph.O2M,
			Inverse: false,
			Table:   playlist.SongsTable,
			Columns: []string{playlist.SongsColumn},
			Bidi:    false,
			Target: &sqlgraph.EdgeTarget{
				IDSpec: &sqlgraph.FieldSpec{
					Type:   field.TypeInt,
					Column: playlistsong.FieldID,
				},
			},
		}
		for _, k := range nodes {
			edge.Target.Nodes = append(edge.Target.Nodes, k)
		}
		_spec.Edges = append(_spec.Edges, edge)
	}
	return _node, _spec
}

// PlaylistCreateBulk is the builder for creating many Playlist entities in bulk.
type PlaylistCreateBulk struct {
	config
	builders []*PlaylistCreate
}

// Save creates the Playlist entities in the database.
func (pcb *PlaylistCreateBulk) Save(ctx context.Context) ([]*Playlist, error) {
	specs := make([]*sqlgraph.CreateSpec, len(pcb.builders))
	nodes := make([]*Playlist, len(pcb.builders))
	mutators := make([]Mutator, len(pcb.builders))
	for i := range pcb.builders {
		func(i int, root context.Context) {
			builder := pcb.builders[i]
			builder.defaults()
			var mut Mutator = MutateFunc(func(ctx context.Context, m Mutation) (Value, error) {
				mutation, ok := m.(*PlaylistMutation)
				if !ok {
					return nil, fmt.Errorf("unexpected mutation type %T", m)
				}
				if err := builder.check(); err != nil {
					return nil, err
				}
				builder.mutation = mutation
				nodes[i], specs[i] = builder.createSpec()
				var err error
				if i < len(mutators)-1 {
					_, err = mutators[i+1].Mutate(root, pcb.builders[i+1].mutation)
				} else {
					spec := &sqlgraph.BatchCreateSpec{Nodes: specs}
					// Invoke the actual operation on the latest mutation in the chain.
					if err = sqlgraph.BatchCreate(ctx, pcb.driver, spec); err != nil {
						if sqlgraph.IsConstraintError(err) {
							err = &ConstraintError{msg: err.Error(), wrap: err}
						}
					}
				}
				if err != nil {
					return nil, err
				}
				mutation.id = &nodes[i].ID
				mutation.done = true
				return nodes[i], nil
			})
			for i := len(builder.hooks) - 1; i >= 0; i-- {
				mut = builder.hooks[i](mut)
			}
			mutators[i] = mut
		}(i, ctx)
	}
	if len(mutators) > 0 {
		if _, err := mutators[0].Mutate(ctx, pcb.builders[0].mutation); err != nil {
			return nil, err
		}
	}
	return nodes, nil
}

// SaveX is like Save, but panics if an error occurs.
func (pcb *PlaylistCreateBulk) SaveX(ctx context.Context) []*Playlist {
	v, err := pcb.Save(ctx)
	if err != nil {
		panic(err)
	}
	return v
}

// Exec executes the query.
func (pcb *PlaylistCreateBulk) Exec(ctx context.Context) error {
	_, err := pcb.Save(ctx)
	return err
}

// ExecX is like Exec, but panics if an error occurs.
func (pcb *PlaylistCreateBulk) ExecX(ctx context.Context) {
	if err := pcb.Exec(ctx); err != nil {
		panic(err)
	}
}
